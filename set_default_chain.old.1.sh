#!/bin/sh

#mv /blockexplorer/expedition/src/hooks/useChainList.ts ./useChainList.ts.origin
CHAIN_NAME=${CHAIN_NAME:-"Ethereum Classic"}
CHAIN_TYPE=${CHAIN_TYPE:-"mainnet"}
NODE_RPC_URL=${NODE_RPC_URL:-"https://www.ethercluster.com/etc"}
#/blockexplorer/expedition/src/hooks/useChainList.ts
cat << EOF > src/hooks/useChainList.ts

import { IChain as Chain } from "../models/chain";
import React from "react";

const chain_name=$CHAIN_NAME
const chain_type=$CHAIN_TYPE
const chain_rpc=$NODE_RPC_URL

export default function() {
  const [chains, setChains] = React.useState<Chain[]>([
    {
      name: "localRMIT",
      network: "local",
      rpc: ["http://127.0.0.1:9545"],
    },
    {
      name: chain_name,
      network: chain_type,
      rpc: [chain_rpc],
    }
  ]);
  return [chains, setChains];
}

EOF
