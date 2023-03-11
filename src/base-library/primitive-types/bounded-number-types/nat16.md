

# Nat16
The *convention* is to name the [*module alias*](/common-programming-concepts/modules.html#imports) after the *file name* it is defined in:

```motoko
{{#include _mo/nat16.mo:a}}
```
## Public items
The following types and functions are made public in the `Nat16` module:  
[Type Nat16](#type)  
[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)  
[Function `toNat`](#nat16tonat)    
[Function `toText`](#nat16totext)  
[Function `fromNat`](#nat16fromnat)  
[Function `fromIntWrap`](#nat16fromintwrap)  


## Type
```motoko
type Nat16 = Nat16.Nat16
```
## MinimumValue
```motoko
let minimumValue : Nat16 = 0;

```
## MaximumValue
```motoko
let maximumValue : Nat16 = 65,535;

```


## Nat16.toNat
The function `toNat` takes one `Nat16` argument and returns an `Nat` value.

```motoko
{{#include _mo/nat16.mo:b}}
```
## Nat16.toText
The function `toText` takes one `Nat16` argument and returns a `Text` value. 

```motoko
{{#include _mo/nat16.mo:c}}
```
## Nat16.fromNat
The function `fromNat` takes one `Nat` argument and returns an `Nat16` value. 

```motoko
{{#include _mo/nat16.mo:d}}
```
## Nat16.fromIntWrap
The function `fromIntWrap` takes one `Int` argument and returns an `Int` value. 

```motoko
{{#include _mo/nat16.mo:e}}
```
```


