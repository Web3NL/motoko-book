# Introduction

[Motoko](https://internetcomputer.org/docs/current/developer-docs/build/cdks/motoko-dfinity/motoko/) is a programming language developed by [DFINITY](https://dfinity.org/) for writing advanced blockchain programs ([smart contracts](https://en.wikipedia.org/wiki/Smart_contract)) on the [Internet Computer](https://internetcomputer.org/).

Blockchain programs are a new kind of software that runs in the form of *canisters*  on the Internet Computer blockchain instead of a personal computer or a data center server. This has several advantages:
- **Security**: Blockchain programs are guaranteed to run the way they are programmed and are therefore tamper-proof. 
- **Autonomy**: Blockchain programs can run 'on their own' without an owner or controller. 
- **Programmable scarcity**: Digital valuable items like currencies and tokens are just numbers in computer code. 
- **Reduced Complexity**: Eliminates the need for traditional IT stack 
- **Scalability**: Asynchronous message passing between actors allows for scalable systems

Motoko allows writing a broad range of blockchain applications from small microservices to large networks of smart contracts all interacting to serve millions of users. In this book we review the Motoko language features and describe how to use them with examples. 

We start with common programming concepts found in any language. We then move on to special features for programming on the Internet Computer. We also review the *Motoko Base Library* and tackle advanced programming concepts. And finally, we go over common canisters (smart contracts) in the Internet Computer ecosystem and also describe common community standards within the context of Motoko Programming.

Along the way, we will develop ideas and techniques that allow us to build a *Tokenized Comments* section that demonstrates many cool features of Motoko and the Internet Computer. 