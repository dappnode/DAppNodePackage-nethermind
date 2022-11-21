# Nethermind (Execution Client)

Welcome to the Merged Mainnet Nethermind Execution Client.

There are now two RPC APIs in Execution Clients:

1. Querying API `http://nethermind.public.dappnode:8545`. Use this endpoint to query transactions on your node and connect to it with your web3 wallet.
2. Engine API `http://nethermind.public.dappnode:8551`. Use this endpoint to connect your Beacon Chain (Consensus Layer) client.

If your Execution Client is not connected to a Consensus Layer client, you won't be able to use it to query the blockchain, nor will you be able to connect your wallet to it!
