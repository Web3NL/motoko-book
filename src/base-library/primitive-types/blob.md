# Blob
The Blob module is a built-in module in the Motoko language for working with immutable sequences of bytes. Blobs are similar to arrays of bytes, but are more efficient and take up less memory.


The convention is to name the *module alias* after the *file name* it is defined in:

```motoko
{{#include _mo/blob.mo:a}}
```

## Public items
The following types and functions are made public in the `Blob` module:  
[Type Blob](#type)  
[Function `fromArray`](#blobfromarray)  
[Function `toArray`](#blobtoarray)  
[Function `toArrayMut`](#blobfromarraymut)  
[Function `fromArrayMut`](#blobfromarraymut)  


## Type
```motoko
type Blob = Blob.Blob
```

## Blob.fromArray
The function `fromArray` takes one `Array` argument and returns a `Blob` value.  

```motoko
{{#include _mo/blob.mo:b}}
```
## Blob.toArray
The function `toArray` takes one `Blob` argument and returns a `Array` value.  

```motoko
{{#include _mo/blob1.mo:a}}
```
## Blob.toArrayMut
The function `toArrayMut` takes one `Blob` argument and returns a `Mutable Array` value.  

```motoko
{{#include _mo/blob2.mo:a}}
```
## Blob.fromArrayMut
The function `fromArrayMut` takes one `Mutable Array` argument and returns a `Blob` value.  

```motoko
{{#include _mo/blob3.mo:a}}
```


Type Blob
Value fromArray
Value fromArrayMut
Value toArray
Value toArrayMut