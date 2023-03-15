# Int64

## Public items
The following types and functions are made public in the `Int64` module:  
[Type Int64](#type)  
[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)  
[Function `toInt`](#int64toint)    
[Function `toText`](#int64totext)  
[Function `fromInt`](#int64fromint)  
[Function `fromNat64`](#int64fromnat64)  
[Function `toNat64`](#int64tonat64)  

## Type
```motoko
type Int64 = Int64.Int64
```
## MinimumValue
```motoko
let minimumValue : Int64 = -9223372036854775808

```
## MaximumValue
```motoko
let maximumValue : Int64= 9223372036854775807

```

## Int64.toInt
The function `toInt` takes one `Int64` argument and returns an `Int` value. 

```motoko
{{#include _mo/int64.mo:b}}
```

## Int64.toText
The function `toText` takes one `Int64` argument and returns a `Text` value. 

```motoko
{{#include _mo/int64.mo:c}}
```

## Int64.fromInt
The function `fromInt` takes one `Int` argument and returns an `Int64` value. 

```motoko
{{#include _mo/int64a.mo:a}}
```

## Int64.fromNat64
The function `fromNat64` takes one `Nat64` argument and returns an `Int64` value. 

```motoko
{{#include _mo/int64b.mo:a}}
```

## Int64.toNat64
The function `toNat64` takes one `Int64` argument and returns an `Nat64` value. 

```motoko
{{#include _mo/int64c.mo:a}}
```

