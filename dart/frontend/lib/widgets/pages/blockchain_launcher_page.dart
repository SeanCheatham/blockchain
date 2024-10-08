import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:giraffe_frontend/utils.dart';
import 'package:giraffe_frontend/widgets/clipboard_address_button.dart';
import 'package:giraffe_frontend/widgets/giraffe_card.dart';
import 'package:giraffe_frontend/widgets/giraffe_scaffold.dart';
import 'package:giraffe_frontend/widgets/pages/advanced_page.dart';
import 'package:giraffe_protocol/protocol.dart';
import 'package:go_router/go_router.dart';

import '../../providers/settings.dart';
import '../../providers/storage.dart';
import '../../providers/wallet_key.dart';
import 'package:giraffe_sdk/sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bip39/bip39.dart' as bip39;

class BlockchainLauncherPage extends ConsumerWidget {
  const BlockchainLauncherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
        future: ref
            .read(podSecureStorageProvider.notifier)
            .apiAddress
            .then((v) => Wrapped(v)),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SettingsPage(
                initialApiAddress: snapshot.requireData.value ?? "/api");
          } else if (snapshot.hasError) {
            return error(snapshot.error!);
          } else {
            return loading;
          }
        });
  }

  Widget get loading =>
      const GiraffeScaffold(body: Center(child: CircularProgressIndicator()));

  Widget error(Object message) =>
      GiraffeScaffold(body: Center(child: Text(message.toString())));
}

class Wrapped<T> {
  final T value;

  Wrapped(this.value);
}

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key, required this.initialApiAddress});

  final String? initialApiAddress;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SettingsPageState();
}

class SettingsPageState extends ConsumerState<SettingsPage> {
  late String? apiAddress;
  String? error;
  bool addressIsValid = false;
  Timer? debounceTimer;

  late final TextEditingController addressController;

  @override
  void initState() {
    super.initState();
    apiAddress = widget.initialApiAddress;
    addressController = TextEditingController(text: apiAddress);
    if (apiAddress != null) {
      checkAddress(apiAddress!);
    }
  }

  @override
  Widget build(BuildContext context) => GiraffeScaffold(
          body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topLeft,
          child: GiraffeCard(
            child: settingsForm(context),
          ),
        ),
      ));

  Column settingsForm(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          logo(context).pad8,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Giraffe", style: Theme.of(context).textTheme.displayLarge),
              Text("Chain", style: Theme.of(context).textTheme.displayLarge),
            ],
          ),
        ]),
        addressField(context),
        walletForm(context),
        Wrap(children: [
          connectButton(context),
          advancedButton(context),
        ]),
      ].padAll8,
    );
  }

  Widget logo(BuildContext context) {
    return SvgPicture.asset("assets/images/logo.svg", height: 128);
  }

  Widget addressField(BuildContext context) {
    const prompt = Text("API Address");
    void onChanged(String updated) {
      apiAddress = updated;
      checkAddress(updated);
    }

    final textField = ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 480),
      child: TextField(
        onChanged: onChanged,
        controller: addressController,
        decoration: InputDecoration(
            hintText: apiAddress ?? "http://localhost:2024/api", label: prompt),
      ),
    );
    final errorField = error == null
        ? null
        : Text(error!,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .merge(TextStyle(color: Theme.of(context).colorScheme.error)));
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [textField, if (errorField != null) errorField],
    );
  }

  checkAddress(String updated) async {
    setState(() {
      addressIsValid = false;
      error = null;
    });
    debounceTimer?.cancel();
    debounceTimer = null;
    try {
      final parsed = Uri.parse(updated);
      assert(parsed.scheme.isEmpty ||
          parsed.scheme == "http" ||
          parsed.scheme == "https");
    } catch (_) {
      setState(() {
        error = "Invalid URL";
        addressIsValid = false;
      });
      return;
    }
    error = "Attempting to connect...";
    debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      try {
        await BlockchainClientFromJsonRpc(baseAddress: updated)
            .canonicalHeadId
            .timeout(const Duration(seconds: 2));
      } catch (e) {
        setState(() {
          error = "Failed to connect";
          addressIsValid = false;
        });
        return;
      }
      setState(() {
        error = null;
        addressIsValid = true;
      });
    });
  }

  Widget walletForm(BuildContext context) => const WalletSelectionForm();

  Widget connectButton(BuildContext context) {
    final isValid = addressIsValid && ref.watch(podWalletKeyProvider) != null;
    final Function()? onPressed = isValid
        ? () {
            ref.read(podSettingsProvider.notifier).setApiAddress(apiAddress);
            context.push("/blockchain");
          }
        : null;
    return ElevatedButton.icon(
      label: const Text("Connect"),
      onPressed: onPressed,
      icon: const Icon(Icons.network_ping),
    );
  }

  Widget advancedButton(BuildContext context) {
    return TextButton.icon(
      onPressed: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AdvancedPage())),
      icon: const Icon(
        Icons.warning,
        size: 18,
      ),
      label: Text(
        "Advanced",
        style: Theme.of(context).textTheme.bodySmall!,
      ),
    );
  }
}

class WalletSelectionForm extends ConsumerStatefulWidget {
  const WalletSelectionForm({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      WalletSelectionFormState();
}

class WalletSelectionFormState extends ConsumerState<WalletSelectionForm> {
  @override
  Widget build(BuildContext context) {
    if (ref.watch(podWalletKeyProvider) == null) {
      return uninitialized(context);
    } else {
      return initialized(context);
    }
  }

  Widget uninitialized(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Select a wallet",
              style: Theme.of(context).textTheme.titleLarge),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              TextButton.icon(
                label: const Text("Public"),
                onPressed: () async =>
                    onSelected(await PrivateTestnet.defaultKeyPair),
                icon: const Icon(Icons.people),
              ),
              TextButton.icon(
                label: const Text("Create"),
                onPressed: () => _create(context),
                icon: const Icon(Icons.add),
              ),
              TextButton.icon(
                label: const Text("Import"),
                onPressed: () => _import(context),
                icon: const Icon(Icons.text_format),
              ),
            ],
          ),
          loadOrResetButtons(context),
        ].padAll8,
      );

  Widget initialized(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Wallet is loaded",
                  style: Theme.of(context).textTheme.titleLarge)
              .pad8,
          const ClipboardAddressButton().pad8,
          TextButton.icon(
            label: const Text("Unload"),
            onPressed: () =>
                ref.read(podWalletKeyProvider.notifier).setKey(null),
            icon: const Icon(Icons.power_off),
          ).pad8,
        ],
      );

  onSelected(Ed25519KeyPair key) {
    ref.read(podWalletKeyProvider.notifier).setKey(key);
  }

  Widget loadOrResetButtons(BuildContext context) => FutureBuilder(
        future: ref.watch(podSecureStorageProvider.notifier).containsWalletSk,
        builder: (context, snapshot) => !snapshot.hasData
            ? const CircularProgressIndicator()
            : snapshot.data!
                ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    TextButton.icon(
                      label: const Text("Load"),
                      onPressed: () => _load(context),
                      icon: const Icon(Icons.save),
                    ),
                    const VerticalDivider(),
                    TextButton.icon(
                      label: const Text("Delete"),
                      onPressed: () async {
                        await ref
                            .read(podSecureStorageProvider.notifier)
                            .deleteWalletSk();
                        setState(() {});
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ])
                : Container(),
      );

  void _create(BuildContext context) async {
    final Ed25519KeyPair? result = await showDialog(
        context: context, builder: (context) => const CreateWalletModal());
    if (result != null) {
      await ref.read(podSecureStorageProvider.notifier).setWalletSk(result.sk);
      onSelected(result);
    }
  }

  void _import(BuildContext context) async {
    final Ed25519KeyPair? result = await showDialog(
        context: context, builder: (context) => const ImportWalletModal());
    if (result != null) {
      await ref.read(podSecureStorageProvider.notifier).setWalletSk(result.sk);
      onSelected(result);
    }
  }

  void _load(BuildContext context) async {
    final sk = (await ref.read(podSecureStorageProvider.notifier).getWalletSk)!;
    final vk = Uint8List.fromList(await ed25519.getVerificationKey(sk));
    final Ed25519KeyPair result = Ed25519KeyPair(sk, vk);
    onSelected(result);
  }
}

class CreateWalletModal extends StatefulWidget {
  const CreateWalletModal({super.key});

  @override
  State<StatefulWidget> createState() => CreateWalletModalState();
}

class CreateWalletModalState extends State<CreateWalletModal> {
  String? passphrase;
  bool loading = false;
  (String, Ed25519KeyPair)? result;
  @override
  Widget build(BuildContext context) => SimpleDialog(
        title: const Text("Create Wallet"),
        children: result != null
            ? done(context)
            : loading
                ? const [Center(child: CircularProgressIndicator())]
                : requestPassprase(context),
      );

  _generate(BuildContext context) async {
    setState(() => loading = true);
    final mnemonic = bip39.generateMnemonic();
    final seed64 = bip39.mnemonicToSeed(mnemonic, passphrase: passphrase ?? "");
    final seed = seed64.hash256;
    final keyPair = await ed25519.generateKeyPairFromSeed(seed);
    setState(() {
      result = (mnemonic, keyPair);
    });
    return mnemonic;
  }

  List<Widget> requestPassprase(BuildContext context) => [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            onChanged: (v) => passphrase = v,
            decoration: const InputDecoration(hintText: "Passphrase"),
          ),
        ),
        TextButton(
          child: const Text("Create"),
          onPressed: () => _generate(context),
        )
      ];

  List<Widget> done(BuildContext context) => [
        Text("Your mnemonic is:",
            style: Theme.of(context).textTheme.titleLarge),
        TextButton.icon(
          icon: const Icon(Icons.copy),
          label: Text(result!.$1),
          onPressed: () => Clipboard.setData(ClipboardData(text: result!.$1)),
        ),
        const Text(
            "Please record these words in a safe place. Once this dialog is closed, they can't be recovered.",
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.red)),
        TextButton(
          child: const Text("Close"),
          onPressed: () => Navigator.pop(context, result!.$2),
        ),
      ]
          .map(
            (w) => Padding(padding: const EdgeInsets.all(8.0), child: w),
          )
          .toList();
}

class ImportWalletModal extends StatefulWidget {
  const ImportWalletModal({super.key});

  @override
  State<StatefulWidget> createState() => ImportWalletModalState();
}

class ImportWalletModalState extends State<ImportWalletModal> {
  String mnemonic = "";
  String passphrase = "";
  bool loading = false;
  (String, Ed25519KeyPair)? result;
  String? error;
  @override
  Widget build(BuildContext context) => SimpleDialog(
        title: const Text("Import Wallet"),
        children: result != null
            ? done(context)
            : loading
                ? const [Center(child: CircularProgressIndicator())]
                : requestInfo(context),
      );

  _generate(BuildContext context) async {
    if (!bip39.validateMnemonic(mnemonic)) {
      setState(() => error = "Invalid mnemonic");
    } else {
      final seed64 = bip39.mnemonicToSeed(mnemonic, passphrase: passphrase);
      final seed = seed64.hash256;
      setState(() => loading = true);
      final keyPair = await ed25519.generateKeyPairFromSeed(seed);
      setState(() {
        result = (mnemonic, keyPair);
      });
    }
  }

  List<Widget> requestInfo(BuildContext context) {
    final arr = <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: (v) => mnemonic = v,
          decoration: const InputDecoration(hintText: "Mnemonic"),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          onChanged: (v) => passphrase = v,
          decoration: const InputDecoration(hintText: "Passphrase"),
        ),
      ),
    ];
    if (error != null) {
      arr.add(Text(error!,
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.red)));
    }

    arr.add(TextButton(
      child: const Text("Import"),
      onPressed: () => _generate(context),
    ));
    return arr;
  }

  List<Widget> done(BuildContext context) => [
        Text("Your wallet was imported successfully.",
            style: Theme.of(context).textTheme.titleLarge),
        TextButton(
          child: const Text("Close"),
          onPressed: () => Navigator.pop(context, result!.$2),
        ),
      ]
          .map(
            (w) => Padding(padding: const EdgeInsets.all(8.0), child: w),
          )
          .toList();
}
