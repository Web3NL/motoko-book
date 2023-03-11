

# Nat64
The convention is to name the [*module alias*](/common-programming-concepts/modules.html#imports) after the *file name* it is defined in:

```motoko
{{#include _mo/nat64.mo:a}}
```
## Public items
The following types and functions are made public in the `Nat64` module:  
[Type Nat64](#type)  
[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)  
[Function `toNat`](#nat64tonat)    
[Function `toText`](#nat64totext)  
[Function `fromNat`](#nat64fromnat)  
[Function `fromIntWrap`](#nat64fromintwrap)  


## Type
```motoko
type Nat64 = Nat64.Nat64
```
## MinimumValue
```motoko
let minimumValue : Nat64 = 0;

```
## MaximumValue
```motoko
let maximumValue : Nat64 = 18,446,744,073,709,551,615;

```


## Nat64.toNat
The function `toNat` takes one `Nat64` argument and returns an `Nat` value.

```motoko
{{#include _mo/nat64.mo:b}}
```
## Nat64.toText
The function `toText` takes one `Nat64` argument and returns a `Text` value. 

```motoko
{{#include _mo/nat64.mo:c}}
```
## Nat64.fromNat
The function `fromNat` takes one `Nat` argument and returns an `Nat64` value. 

```motoko
{{#include _mo/nat64.mo:d}}
```
## Nat64.fromIntWrap
The function `fromIntWrap` takes one `Int` argument and returns an `Int` value. 

```motoko
{{#include _mo/nat64.mo:f}}
```
```



