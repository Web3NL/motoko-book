# Int32

## Public items
The following types and functions are made public in the `Int32` module:  
[Type Int32](#type)   
[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)  
[Function `toInt`](#int32toint)    
[Function `toText`](#int32totext)  
[Function `fromInt`](#int32fromint)  
[Function `fromNat32`](#int32fromnat32)  
[Function `toNat32`](#int32tonat32)  

## Type
```motoko
type Int32 = Int32.Int32
```
## MinimumValue
```motoko
let minimumValue : Int32 = -2147483648

```
## MaximumValue
```motoko
let maximumValue : Int32 = 2147483647

```

## Int32.toInt
The function `toInt` takes one `Int32` argument and returns an `Int` value. 

```motoko
{{#include _mo/int32.mo:b}}
```

## Int32.toText
The function `toText` takes one `Int32` argument and returns a `Text` value. 

```motoko
{{#include _mo/int32.mo:c}}
```

## Int32.fromInt
The function `fromInt` takes one `Int` argument and returns an `Int32` value. 

```motoko
{{#include _mo/int32a.mo:a}}
```

## Int32.fromNat32
The function `fromNat32` takes one `Nat32` argument and returns an `Int32` value. 

```motoko
{{#include _mo/int32b.mo:a}}
```

## Int32.toNat32
The function `toNat32` takes one `Int32` argument and returns an `Nat32` value. 

```motoko
{{#include _mo/int32c.mo:a}}
```

