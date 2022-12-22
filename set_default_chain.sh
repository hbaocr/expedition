#!/bin/bash

#mv /blockexplorer/expedition/src/hooks/useChainList.ts ./useChainList.ts.origin
# CHAIN_NAME=${CHAIN_NAME:-"Ethereum Classic"}
# CHAIN_TYPE=${CHAIN_TYPE:-"mainnet"}
# NODE_RPC_URL=${NODE_RPC_URL:-"https://www.ethercluster.com/etc"}
#/blockexplorer/expedition/src/hooks/useChainList.ts
cat << EOF > src/hooks/useChainList.ts

import { IChain as Chain } from "../models/chain";
import React from "react";

export default function() {
  let rpc_url="";
   if (typeof window !== 'undefined') {
    rpc_url= "http://"+window.location.hostname+":9545";
  }else{
    rpc_url= "http://127.0.0.1:9545";
  }

  const [chains, setChains] = React.useState<Chain[]>([
    {
      name: "RMIT Lab Coin",
      network: "Lecturer's Node",
      rpc: [rpc_url],
    },
     {
      name: "RMIT Lab Coin(Local)",
      network: "Local Node",
      rpc: ["http://127.0.0.1:9545"],
    }
  ]);
  return [chains, setChains];
}

EOF