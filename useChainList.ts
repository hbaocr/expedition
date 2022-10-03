import { IChain as Chain } from "../models/chain";
import React from "react";


// const mergeChainSets = (c1: Chain[], c2: Chain[]) => uniqBy(c1.concat(c2), "name");
const chain_name=process.env.CHAIN_NAME ||"Ethereum POA"
const chain_type=process.env.CHAIN_TYPE ||"Private"
const chain_rpc=process.env.NODE_RPC_URL ||"http://data-node.rmit-demo.online:9545"

export default function() {
  const [chains, setChains] = React.useState<Chain[]>([
    {
      name: chain_name,
      network: chain_type,
      rpc: [chain_rpc],
    }
  ]);
  return [chains, setChains];
}

