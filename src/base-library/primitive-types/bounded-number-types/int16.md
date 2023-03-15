# Int16

## Public items
The following types and functions are made public in the `Int16` module:  
[Type Int16](#type)   
[Value `minimumValue`](#minimumvalue)  
[Value `maximumValue`](#maximumvalue)  
[Function `toInt`](#int16toint)    
[Function `toText`](#int16totext)  
[Function `fromInt`](#int16fromint)  
[Function `fromNat16`](#int16fromnat16)  
[Function `toNat16`](#int16tonat16)  

## Type
```motoko
type Int16 = Int16.Int16
```
## MinimumValue
```motoko
let minimumValue : Int16 = -32768

```
## MaximumValue
```motoko
let maximumValue : Int16 = 32767

```

## Int16.toInt
The function `toInt` takes one `Int16` argument and returns an `Int` value. 

```motoko
{{#include _mo/int16.mo:b}}
```

## Int16.toText
The function `toText` takes one `Int16` argument and returns a `Text` value. 

```motoko
{{#include _mo/int16.mo:c}}
```

## Int16.fromInt
The function `fromInt` takes one `Int` argument and returns an `Int16` value. 

```motoko
{{#include _mo/int16a.mo:a}}
```

## Int16.fromNat16
The function `fromNat16` takes one `Nat16` argument and returns an `Int16` value. 

```motoko
{{#include _mo/int16b.mo:a}}
```

## Int16.toNat16
The function `toNat16` takes one `Int16` argument and returns an `Nat16` value. 

```motoko
{{#include _mo/int16c.mo:a}}
```
