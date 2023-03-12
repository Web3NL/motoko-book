# Int8
The *convention* is to name the [*module alias*](/common-programming-concepts/modules.html#imports) after the *file name* it is defined in:

```motoko
{{#include _mo/int8.mo:a}}
```
## Public items
The following types and functions are made public in the `Int` module:  
[Type Int8](#type)
[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)  
[Function `toInt`](#int8toint)    
[Function `toText`](#int8totext)  
[Function `fromInt`](#int8fromint)  
[Function `fromNat8`](#int8fromnat8)  
[Function `toNat8`](#int8tonat8)  


## Type
```motoko
type Int8 = Int8.Int8
```
## MinimumValue
```motoko
let minimumValue : Int8 = -128

```
## MaximumValue
```motoko
let maximumValue : Int8 = 127

```


## Int8.toInt
### Function signature
```motoko
public func toInt(i : Int8) : Int
```
The function `toInt` takes one `Int8` argument and returns an `Int` value.

### Code example
```motoko
{{#include _mo/int8.mo:b}}
```
## Int8.toText
The function `toText` takes one `Int8` argument and returns a `Text` value. 

```motoko
{{#include _mo/int8.mo:c}}
```
## Int8.fromInt
The function `fromInt` takes one `Int` argument and returns an `Int8` value. 

```motoko
{{#include _mo/int8a.mo:a}}
```
## Int8.fromNat8
The function `fromNat8` takes one `Nat8` argument and returns an `Int8` value. 

```motoko
{{#include _mo/int8b.mo:a}}
```
## Int8.toNat8
The function `toNat8` takes one `Int8` argument and returns an `Nat8` value. 

```motoko
{{#include _mo/int8c.mo:a}}
```


