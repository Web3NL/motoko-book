# ExperimentalStableMemory

```motoko
{{#include _mo/experimentalStableMemory/experimentalStableMemory.mo:a}}
```

### On this page

[Function `size`](#experimentalcyclesbalance)  
[Function `grow`](#experimentalcyclesbalance)  
[Function `stableVarQuery`](#experimentalcyclesbalance)  
[Function `loadNat32`](#experimentalcyclesbalance)  
[Function `storeNat32`](#experimentalcyclesbalance)  
[Function `loadNat8`](#experimentalcyclesbalance)  
[Function `storeNat8`](#experimentalcyclesbalance)  
[Function `loadNat16`](#experimentalcyclesbalance)  
[Function `storeNat16`](#experimentalcyclesbalance)  
[Function `loadNat64`](#experimentalcyclesbalance)  
[Function `storeNat64`](#experimentalcyclesbalance)  
[Function `loadInt32`](#experimentalcyclesbalance)  
[Function `storeInt32`](#experimentalcyclesbalance)  
[Function `loadInt8`](#experimentalcyclesbalance)  
[Function `storeInt8`](#experimentalcyclesbalance)  
[Function `loadInt16`](#experimentalcyclesbalance)  
[Function `storeInt16`](#experimentalcyclesbalance)  
[Function `loadInt64`](#experimentalcyclesbalance)  
[Function `storeInt64`](#experimentalcyclesbalance)  


## ExperimentalStableMemory.size

```motoko
let size : () -> (pages : Nat64)
```

```motoko
{{#include _mo/experimentalCycles/balance.mo:a}}
```

## ExperimentalStableMemory.grow

```motoko
let grow : (newPages : Nat64) -> (oldPages : Nat64)
```

```motoko
{{#include _mo/experimentalCycles/balance.mo:a}}
```

## ExperimentalStableMemory.stableVarQuery

```motoko
let stableVarQuery : () -> (shared query () -> async { size : Nat64 })
```

```motoko
{{#include _mo/experimentalCycles/balance.mo:a}}
```

## ExperimentalStableMemory.loadNat32

```motoko
let loadNat32 : (offset : Nat64) -> Nat32
```

```motoko
{{#include _mo/experimentalCycles/balance.mo:a}}
```

## ExperimentalStableMemory.storeNat32

```motoko
let storeNat32 : (offset : Nat64, value : Nat32) -> ()
```

```motoko
{{#include _mo/experimentalCycles/balance.mo:a}}
```
## ExperimentalStableMemory.loadNat8

```motoko
let loadNat8 : (offset : Nat64) -> Nat8
```

```motoko
{{#include _mo/experimentalCycles/balance.mo:a}}
```

## ExperimentalStableMemory.storeNat8

```motoko
let storeNat8 : (offset : Nat64, value : Nat8) -> ()
```

```motoko
{{#include _mo/experimentalCycles/balance.mo:a}}
```

## ExperimentalStableMemory.loadNat16

```motoko
let loadNat16 : (offset : Nat64) -> Nat16
```

```motoko
{{#include _mo/experimentalCycles/balance.mo:a}}
```

## ExperimentalStableMemory.storeNat16

```motoko
let storeNat16 : (offset : Nat64, value : Nat16) -> ()
```

```motoko
{{#include _mo/experimentalCycles/balance.mo:a}}
```
## ExperimentalStableMemory.loadNat64

```motoko
let loadNat64 : (offset : Nat64) -> Nat64
```

```motoko
{{#include _mo/experimentalCycles/balance.mo:a}}
```

## ExperimentalStableMemory.storeNat64

```motoko
let storeNat64 : (offset : Nat64, value : Nat64) -> ()
```

```motoko
{{#include _mo/experimentalCycles/balance.mo:a}}
```
## ExperimentalStableMemory.loadInt64

```motoko
let loadNat64 : (offset : Nat64) -> Nat64
```

```motoko
{{#include _mo/experimentalCycles/balance.mo:a}}
```

## ExperimentalStableMemory.storeNat64

```motoko
let storeNat64 : (offset : Nat64, value : Nat64) -> ()
```

```motoko
{{#include _mo/experimentalCycles/balance.mo:a}}
```