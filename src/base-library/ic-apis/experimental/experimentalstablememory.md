# ExperimentalStableMemory

```motoko
{{#include _mo/experimentalStableMemory/experimentalStableMemory.mo:a}}
```

### On this page

[Function `size`](#experimentalstablememorysize)  
[Function `grow`](#experimentalstablememorygrow)  
[Function `stableVarQuery`](#experimentalstablememorystablevarquery)  
[Function `loadNat32`](#experimentalstablememoryloadnat32)  
[Function `storeNat32`](#experimentalstablememorystorenat32)  
[Function `loadNat8`](#experimentalstablememoryloadnat8)  
[Function `storeNat8`](#experimentalstablememorystorenat8)  
[Function `loadNat16`](#experimentalstablememoryloadnat16)  
[Function `storeNat16`](#experimentalstablememorystorenat16)  
[Function `loadNat64`](#experimentalstablememoryloadnat64)  
[Function `storeNat64`](#experimentalstablememorystorenat64)  
[Function `loadInt32`](#experimentalstablememoryloadint32)  
[Function `storeInt32`](#experimentalstablememorystoreint32)  
[Function `loadInt8`](#experimentalstablememoryloadint8)  
[Function `storeInt8`](#experimentalstablememorystoreint8)  
[Function `loadInt16`](#experimentalstablememoryloadint16)  
[Function `storeInt16`](#experimentalstablememorystoreint16)  
[Function `loadInt64`](#experimentalstablememoryloadint64)  
[Function `storeInt64`](#experimentalstablememorystoreint64)  


## ExperimentalStableMemory.size

```motoko
func size : () -> (pages : Nat64)
```

```motoko
{{#include _mo/experimentalStableMemory/size.mo:a}}
```

## ExperimentalStableMemory.grow

```motoko
func grow : (newPages : Nat64) -> (oldPages : Nat64)
```

```motoko
{{#include _mo/experimentalStableMemory/grow.mo:a}}
```

## ExperimentalStableMemory.stableVarQuery

```motoko
func stableVarQuery : () -> (shared query () -> async { size : Nat64 })
```

```motoko
{{#include _mo/experimentalStableMemory/stableVarQuery.mo:a}}
```

## ExperimentalStableMemory.loadNat32

```motoko
func loadNat32 : (offset : Nat64) -> Nat32
```

```motoko
{{#include _mo/experimentalStableMemory/loadNat32.mo:a}}
```

## ExperimentalStableMemory.storeNat32

```motoko
func storeNat32 : (offset : Nat64, value : Nat32) -> ()
```

```motoko
{{#include _mo/experimentalStableMemory/storeNat32.mo:a}}
```
## ExperimentalStableMemory.loadNat8

```motoko
func loadNat8 : (offset : Nat64) -> Nat8
```

```motoko
{{#include _mo/experimentalStableMemory/loadNat8.mo:a}}
```

## ExperimentalStableMemory.storeNat8

```motoko
func storeNat8 : (offset : Nat64, value : Nat8) -> ()
```

```motoko
{{#include _mo/experimentalStableMemory/storeNat8.mo:a}}
```

## ExperimentalStableMemory.loadNat16

```motoko
func loadNat16 : (offset : Nat64) -> Nat16
```

```motoko
{{#include _mo/experimentalStableMemory/loadNat16.mo:a}}
```

## ExperimentalStableMemory.storeNat16

```motoko
func storeNat16 : (offset : Nat64, value : Nat16) -> ()
```

```motoko
{{#include _mo/experimentalStableMemory/storeNat16.mo:a}}
```
## ExperimentalStableMemory.loadNat64

```motoko
func loadNat64 : (offset : Nat64) -> Nat64
```

```motoko
{{#include _mo/experimentalStableMemory/loadNat64.mo:a}}
```

## ExperimentalStableMemory.storeNat64

```motoko
func storeNat64 : (offset : Nat64, value : Nat64) -> ()
```

```motoko
{{#include _mo/experimentalStableMemory/storeNat64.mo:a}}
```
## ExperimentalStableMemory.loadInt32

```motoko
func loadInt32 : (offset : Nat64) -> Int32
```

```motoko
{{#include _mo/experimentalStableMemory/loadInt32.mo:a}}
```

## ExperimentalStableMemory.storeInt32

```motoko
func storeInt32 : (offset : Nat64, value : Int32) -> ()
```

```motoko
{{#include _mo/experimentalStableMemory/storeInt32.mo:a}}
```
## ExperimentalStableMemory.loadInt8

```motoko
func loadInt8 : (offset : Nat64) -> Int8
```

```motoko
{{#include _mo/experimentalStableMemory/loadInt8.mo:a}}
```

## ExperimentalStableMemory.storeInt8

```motoko
func storeInt8 : (offset : Nat64, value : Int8) -> ()
```

```motoko
{{#include _mo/experimentalStableMemory/storeInt8.mo:a}}
```
## ExperimentalStableMemory.loadInt16

```motoko
func loadInt16 : (offset : Nat64) -> Int16
```

```motoko
{{#include _mo/experimentalStableMemory/loadInt16.mo:a}}
```

## ExperimentalStableMemory.storeInt16

```motoko
func storeInt16 : (offset : Nat64, value : Int16) -> ()
```

```motoko
{{#include _mo/experimentalStableMemory/storeInt16.mo:a}}
```
## ExperimentalStableMemory.loadInt64

```motoko
func loadInt64 : (offset : Nat64) -> Int64
```

```motoko
{{#include _mo/experimentalStableMemory/loadInt64.mo:a}}
```

## ExperimentalStableMemory.storeInt64

```motoko
func storeInt64 : (offset : Nat64, value : Int64) -> ()
```

```motoko
{{#include _mo/experimentalStableMemory/storeInt64.mo:a}}
```