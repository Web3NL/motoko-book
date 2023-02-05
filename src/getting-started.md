# Getting Started

[Motoko Playground](https://m7sm4-2iaaa-aaaab-qabra-cai.raw.ic0.app/) is the easiest way to deploy a *Hello World* example in Motoko. 

Motoko Playground is an online code editor for Motoko. It allows us to use Motoko without having a [local development environment](/project-deployment/installing-sdk.html). It simplifies the process of deploying Motoko code to the Internet Computer.

## Hello World!

1. Open [Motoko Playground](https://m7sm4-2iaaa-aaaab-qabra-cai.raw.ic0.app/) and click on `Hello, world` in the list of examples. 

1. Then click on the `Main.mo` file in the files list on the left.

1. Checkout the code and hit the `Deploy` button on the top right.

1. Finally, click the `Install` button in the popup window. 

Motoko Playground will now deploy your code to the Internet Computer! 

You should see a `Candid UI` on the right hand side of your screen. Write something in the text box and click the `QUERY` button. The output should be displayed in the `OUTPUT LOG`.

## Next steps
Exploring the Motoko Playground will help you gain familiarity with the basics of Motoko and related concepts.

It is recommended to explore the example projects. Taking the time to read every line, instead of just *skimming* through the code, will greatly increase your understanding.

While exploring you will encounter things you don't understand. Be comfortable with that and continue exploring carefully. 

Whenever you feel ready, consider [installing](/project-deployment/installing-sdk.html) the Canister Development Kit.

## [How it works](/internet-computer-programming-concepts/actor-to-canister.html)
When you deploy code in Motoko Playground, a couple of things happen:
- The Motoko code is compiled into a [Webassembly module](/internet-computer-programming-concepts/actor-to-canister.html#code-compiling-and-wasm-modules).
- A new [*canister*](/internet-computer-programming-concepts/actor-to-canister.html#canister) is created on the Internet Computer.
- The Webassembly module is *installed* in the canister.
- A [*candid*](/internet-computer-programming-concepts/async-data/candid.html) interface file will be generated
- The Candid UI allows you to interact with the [actor](/internet-computer-programming-concepts/actors.html) that is defined in the Motoko code
