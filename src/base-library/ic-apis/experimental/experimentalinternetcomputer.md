# ExperimentalInternetComputer

```motoko
{{#include _mo/experimentalInternetComputer/experimentalInternetComputer.mo:a}}
```

### On this page

[Function `call`](#experimentalinternetcomputercall)  
[Function `countInstructions`](#experimentalinternetcomputercountinstructions)

## ExperimentalInternetComputer.call

```motoko
func call : (canister : Principal, name : Text, data : Blob) -> async (reply : Blob)
```

```motoko
{{#include _mo/experimentalInternetComputer/call.mo:a}}
```

## ExperimentalInternetComputer.countInstructions

```motoko
func countInstructions(comp : () -> ()) : Nat64
```

```motoko
{{#include _mo/experimentalInternetComputer/countInstructions.mo:a}}
```
