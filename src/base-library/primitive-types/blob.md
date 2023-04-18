> **BETA WARNING** _This chapter is being reviewed and updated_

# Blob

A blob is an immutable sequences of bytes. Blobs are similar to arrays of bytes `[Nat8]`.

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/blob/blob.mo:a}}
```

### Conversion

[Function `fromArray`](#blobfromarray)  
[Function `toArray`](#blobtoarray)  
[Function `toArrayMut`](#blobtoarraymut)  
[Function `fromArrayMut`](#blobfromarraymut)

### Utility Function

[Function `hash`](#blobhash)

### Comparison

[Function `compare`](#blobcompare)  
[Function `equal`](#blobequal)  
[Function `notEqual`](#blobnotequal)  
[Function `less`](#blobless)  
[Function `lessOrEqual`](#bloblessorequal)  
[Function `greater`](#blobgreater)  
[Function `greaterOrEqual`](#blobgreaterorequal)  

## Blob.fromArray

```motoko
func fromArray(bytes : [Nat8]) : Blob
```

```motoko, run
{{#include _mo/blob/fromArray.mo:a}}
```
## Blob.toArray

```motoko
func toArray(blob : Blob) : [Nat8]
```

```motoko, run
{{#include _mo/blob/toArray.mo:a}}
```
## Blob.toArrayMut

```motoko
func toArrayMut(blob : Blob) : [var Nat8]
```

```motoko, run
{{#include _mo/blob/toArrayMut.mo:a}}
```
## Blob.fromArrayMut

```motoko
func fromArrayMut(bytes : [var Nat8]) : Blob
```

```motoko, run
{{#include _mo/blob/fromArrayMut.mo:a}}
```
## Blob.hash

```motoko
func hash(blob : Blob) : Nat32
```
The function `hash` takes one `Blob` value and returns a `Nat32` value.

```motoko, run
{{#include _mo/blob/hash.mo:a}}
```
## Blob.compare

```motoko
func compare(blob1 : Blob, blob2 : Blob) : {#less; #equal; #greater}
```
The function `compare` takes two `Blob` value and returns an [Order](/base-library/utils/order.html) value.

```motoko, run
{{#include _mo/blob/compare.mo:a}}
```
## Blob.equal

```motoko
func equal(blob1 : Blob, blob2 : Blob) : Bool
```
The function `equal` takes two `Blob` value and returns a `Bool` value.

```motoko, run
{{#include _mo/blob/equal.mo:a}}
```
## Blob.notEqual

```motoko
func notEqual(blob1 : Blob, blob2 : Blob) : Bool
```
The function `notEqual` takes two `Blob` value and returns a `Bool` value.

```motoko, run
{{#include _mo/blob/notEqual.mo:a}}
```
## Blob.less

```motoko
func less(blob1 : Blob, blob2 : Blob) : Bool
```
The function `less` takes two `Blob` value and returns a `Bool` value.

```motoko, run
{{#include _mo/blob/less.mo:a}}
```
## Blob.lessOrEqual

```motoko
func lessOrEqual(blob1 : Blob, blob2 : Blob) : Bool
```
The function `lessOrEqual` takes two `Blob` value and returns a `Bool` value.

```motoko, run
{{#include _mo/blob/lessOrEqual.mo:a}}
```
## Blob.greater

```motoko
func greater(blob1 : Blob, blob2 : Blob) : Bool
```
The function `greater` takes two `Blob` value and returns a `Bool` value.

```motoko, run
{{#include _mo/blob/greater.mo:a}}
```
## Blob.greaterOrEqual

```motoko
func greaterOrEqual(blob1 : Blob, blob2 : Blob) : Bool
```
The function `greaterOrEqual` takes two `Blob` value and returns a `Bool` value.

```motoko, run
{{#include _mo/blob/greaterOrEqual.mo:a}}
```
