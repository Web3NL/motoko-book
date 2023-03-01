
# Nat8
The convention is to name the [*module alias*](/common-programming-concepts/modules.html#imports) after the *file name* it is defined in:

```motoko
{{#include _mo/nat8.mo:a}}
```
## Public items
The following types and functions are made public in the `Nat8` module:  
[Type Nat8](#type)  
[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)  
[Function `toNat`](#nat8tonat)    
[Function `toText`](#nat8totext)  
[Function `fromNat`](#nat8fromnat)  
[Function `fromIntWrap`](#nat8fromintwrap)  


## Type
```motoko
type Nat8 = Nat8.Nat8
```
## MinimumValue
```motoko
let minimumValue : Nat8 = 0

```
## MaximumValue
```motoko
let maximumValue : Nat8 = 255

```


## Nat8.toNat
The function `toNat` takes one `Nat8` argument and returns an `Nat` value.

```motoko
{{#include _mo/nat8.mo:b}}
```
## Nat8.toText
The function `toText` takes one `Nat8` argument and returns a `Text` value. 

```motoko
{{#include _mo/nat8.mo:c}}
```
## Nat8.fromNat
The function `fromNat` takes one `Nat` argument and returns an `Nat8` value. 

```motoko
{{#include _mo/nat8.mo:d}}
```
## Nat8.fromIntWrap
The function `fromIntWrap` takes one `Int` argument and returns an `Int` value. 

```motoko
{{#include _mo/nat8.mo:e}}
```
```


