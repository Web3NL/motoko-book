# Canisters
A *canister* is an instance of an actor that runs on the Internet Computer (IC). The IC provides *system resources* to the canister, like:
- Connectivity: A canister can receive inbound and make outbound *canister calls*.
- Memory: A canister has *main working memory* and also has access to *stable memory*.
- Computation: The code running in a canister is executed by one processor thread. 

## Canister calls
### Inbound call
An external *client* can call a shared function of a running canister. The call can either result in a *reply* or a *reject*. A client could be another canister or an external client outside the IC. 

### Outbound call
A canister can make an outbound call to another canister or make a HTTP request to the Internet. 