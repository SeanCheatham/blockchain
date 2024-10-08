---
title: Testnets
description: Information about the Giraffe Chain public testnets.
sidebar_position: 5
---

# Testnets

The "current" testnet is located here: https://testnet.giraffechain.com

Running block production on phones is a rather amibitious goal. I'm not entirely sure if it'll work in the real world. To find out, I need your help.

Running a global/public graph database on top of a blockchain is also a rather ambitious goal. I need your help to push its use-cases.

Because this chain is still in development, it is extremely likely that a public testnet will need to be reset in order to implement backwards-incompatible changes.

My goal is to make it as easy as possible to _use_ the testnets. Some tokens are freely available in the "public" wallet. Otherwise, check out the [faucet docs](./faucet).

## Testnet 4
Open the [Wallet/App](https://testnet.giraffechain.com) to see the current state of the chain, access your funds, stake, and more.

If you want to help with relay operations, you can do so using Docker.
1. `docker volume create giraffe`
1. `docker run -d --name giraffe --restart=always -p 2023:2023 -p 2024:2024 -v giraffe:/giraffe giraffechain/node:dev --genesis https://github.com/GiraffeChain/giraffe/raw/genesis/testnet4/b_4yXEL2yU13XyRu2S1pbZ9ZUys9aDaV8tKmh6Z5WL6eaQ.pbuf --peer testnet.giraffechain.com:2023`
    - Note: If you are able to open your firewall for public access on port 2023, you can add the `--p2p-public-host auto` argument
