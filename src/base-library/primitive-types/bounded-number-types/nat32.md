

# Nat32
The *convention* is to name the [*module alias*](/common-programming-concepts/modules.html#imports) after the *file name* it is defined in:

```motoko
{{#include _mo/nat32.mo:a}}
```
## Public items
The following types and functions are made public in the `Nat32` module:  
[Type Nat32](#type)  
[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)  
[Function `toNat`](#nat32tonat)    
[Function `toText`](#nat32totext)  
[Function `fromNat`](#nat32fromnat)  
[Function `fromIntWrap`](#nat32fromintwrap)  


## Type
```motoko
type Nat32 = Nat32.Nat32
```
## MinimumValue
```motoko
let minimumValue : Nat32 = 0;

```
## MaximumValue
```motoko
let maximumValue : Nat32 = 4,294,967,295;

```


## Nat32.toNat
The function `toNat` takes one `Nat32` argument and returns an `Nat` value.

```motoko
{{#include _mo/nat32.mo:b}}
```
## Nat32.toText
The function `toText` takes one `Nat32` argument and returns a `Text` value. 

```motoko
{{#include _mo/nat32.mo:c}}
```
## Nat32.fromNat
The function `fromNat` takes one `Nat` argument and returns an `Nat32` value. 

```motoko
{{#include _mo/nat32.mo:d}}
```
## Nat32.fromIntWrap
The function `fromIntWrap` takes one `Int` argument and returns an `Int` value. 

```motoko
{{#include _mo/nat32.mo:e}}
```
```


