# Cycles and ICP

[Canisters](/internet-computer-programming-concepts/actors/actor-to-canister.html#canister) are charged by the Internet Computer (IC) for using resources (like [_memory_](/internet-computer-programming-concepts/basic-memory-persistence.html#basic-memory-persistence) and _computation_) in a token called _cycles_. The more resources a canister uses, the more cycles it has to pay.

Cycles can only be held by canisters. User [principals](/internet-computer-programming-concepts/principals-and-authentication.html#principals-and-authentication) can't directly own cycles on the system.

> **NOTE**  
> _There are different ways a service can associate a cycles balance with a user principal. Each user could get a dedicated cycles canister or cycles balances are accounted for separately while the service keeps the client's cycles in a 'treasury' canister._

## Converting ICP into cycles

ICP is the main token of the IC ecosystem. It's price varies and is subject to market fluctuations. ICP is used as a [governance token](https://internetcomputer.org/how-it-works/architecture-of-the-internet-computer/#governance) inside neurons to vote on proposals in the system. Governance is outside of the scope of this book.

Another use of ICP is the ability to convert it into cycles. There is a [*cycles minting canister*](/common-internet-computer-canisters/cycles-minting-canister.html) (CMC) that accepts ICP in exchange for cycles. The CMC is also aware of the current market price of ICP and ensures that _1 trillion cycles_ (1T) always costs 1 [SDR](https://www.youtube.com/watch?v=Y-wxIXRLfOk).

This mechanism ensures that the price of cycles remains stable over time. The tokenomics of ICP are outside the scope of this book. For more information on this, see [the official docs](https://internetcomputer.org/capabilities/reverse-gas/).

## Cycles wallet

As a developer, you need to hold and manage cycles to deploy canisters and pay for resources. For that you need to setup a [cycles wallet](/project-deployment/cycles-wallet.html).
