# Blob
The Blob module is a built-in module in the Motoko language for working with immutable sequences of bytes. Blobs are similar to arrays of bytes, but are more efficient and take up less memory.


The *convention* is to name the [*module alias*](/common-programming-concepts/modules.html#imports) after the [*file name*](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/blob.mo:a}}
```

### On this page

[Type Blob](#type) 

 **conversion**  
[Function `fromArray`](#blobfromarray)  
[Function `toArray`](#blobtoarray)  
[Function `toArrayMut`](#blobfromarraymut)  
[Function `fromArrayMut`](#blobfromarraymut)  


## Type
```motoko
type Blob = Blob.Blob
```

## Blob.fromArray

```motoko
func fromArray(bytes : [Nat8]) : Blob
```

The function `fromArray` takes one `Array` argument and returns a `Blob` value.  

```motoko, run
{{#include _mo/blob4.mo:a}}
```
## Blob.toArray

```motoko
func toArray(blob : Blob) : [Nat8]
```

The function `toArray` takes one `Blob` argument and returns a `Array` value.  

```motoko, run
{{#include _mo/blob1.mo:a}}
```
## Blob.toArrayMut

```motoko
func toArrayMut(blob : Blob) : [var Nat8]
```

The function `toArrayMut` takes one `Blob` argument and returns a `Mutable Array` value.  

```motoko, run
{{#include _mo/blob2.mo:a}}
```
## Blob.fromArrayMut

```motoko
func fromArrayMut(bytes : [var Nat8]) : Blob
```

The function `fromArrayMut` takes one `Mutable Array` argument and returns a `Blob` value.  

```motoko, run
{{#include _mo/blob3.mo:a}}
```


Type Blob
Value fromArray
Value fromArrayMut
Value toArray
Value toArrayMut