## SKALE Chain Setup

This GitHub repository contains all of the base scripts and contracts needed to setup a SKALE Chain efficiently.

## Setup

1. SSH: `git clone git@github.com/thegreataxios/skale-chain-setup` or HTTPS: `git clone https://github.com/TheGreatAxios/skale-chain-setup`

2. `forge install`, requires [Foundry](https://getfoundry.sh)

3. Setup env file. Run `cp .env.example .env` and input your chain rpc. If you are using a foundry account, ignore the private key.

> Ensure the PRIVATE_KEY or account being used to execute has at least 5 sFUEL or native gas token equivalent

4. Simulate core contract deployment:

```shell

# Simulate with Private Key
forge script ./script/DeployCoreContracts.sol:DeployCoreContracts --rpc-url $RPC_URL --private-key

# Simulate with Account
forge script ./script/DeployCoreContracts.sol:DeployCoreContracts --rpc-url $RPC_URL --account <YourAccountName>
```

## Deployment Scripts

## Foundry Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
