# Nethermind Nethermind (Execution Client)

Nethermind is now ready for the merge!

There are now two RPC APIs in Execution Clients:

1. Querying API `http://nethermind.dappnode:8545`. Use this endpoint to query transactions on your node and connect to it with your web3 wallet.
2. Engine API `http://nethermind.dappnode:8551`. Use this endpoint to connect your Beacon Chain (Consensus Layer) client.

After the merge, if your Execution Client is not connected to a Consensus Layer client, you won't be able to use it to query the blockchain, nor will you be able to connect your wallet to it!
