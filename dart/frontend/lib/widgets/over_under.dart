import 'package:flutter/material.dart';

class OverUnder extends StatelessWidget {
  final Widget over;
  final Widget under;

  const OverUnder({super.key, required this.over, required this.under});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        over,
        under,
      ],
    );
  }
}
