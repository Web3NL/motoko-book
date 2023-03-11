
# Float
The *convention* is to name the [*module alias*](/common-programming-concepts/modules.html#imports) after the [*file name*](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/float.mo:a}}
```

## Public Items

The following types and functions are made public in the `Float` module:  
[Type Float](#type)
[Function `toInt`](#floattoint)    
[Function `sqrt`](#floatsqrt)  
[Function `ceil`](#floatceil)  
[Function `floor`](#floatfloor)  
[Function `fromInt`](#floatfromint)  
[Function `toText`](#floattotext)  
[Function `toInt64`](#floattoint64)  
[Function `fromInt64`](#floatfromint642)  
[Function `format`](#floatformat)  


## Type
```motoko
type Float = Float.Float
```

## Float.toInt

```motoko
let toInt : Float -> Int
```

The function `toInt` takes one `Float` argument and returns an `Int` value. 

```motoko
{{#include _mo/float.mo:b}}
```

## Float.sqrt

```motoko
let sqrt : (x : Float) -> Float
```

The function `sqrt` takes one `Float` argument and returns a `Float` value. 

```motoko
{{#include _mo/float.mo:c}}
```

## Float.ceil

```motoko
let ceil : (x : Float) -> Float
```

The function `ceil` takes one `Float` argument and returns a `Float` value. 

```motoko
{{#include _mo/float.mo:d}}
```

## Float.floor

```motoko
let floor : (x : Float) -> Float
```

The function `floor` takes one `Float` argument and returns a `Float` value. 

```motoko
{{#include _mo/float.mo:e}}
```

## Float.fromInt

```motoko
let fromInt : Int -> Float
```

The function `fromInt` takes one `Int` argument and returns a `Float` value. 

```motoko
{{#include _mo/float.mo:f}}
```

## Float.toText

```motoko
let toText : Float -> Text
```

The function `toText` takes one `Float` argument and returns a `Text` value. 

```motoko
{{#include _mo/float.mo:g}}
```

## Float.toInt64

```motoko
let toInt64 : Float -> Int64
```

The function `toInt64` takes one `Float` argument and returns an `Int64` value. 

```motoko
{{#include _mo/float.mo:h}}
```

## Float.fromInt64

```motoko
let fromInt64 : Int64 -> Float
```

The function `fromInt64` takes one `Int64` argument and returns a `Float` value. 

```motoko
{{#include _mo/float.mo:i}}
```

## Float.format

```motoko
func format(fmt : {#fix : Nat8; #exp : Nat8; #gen : Nat8; #hex : Nat8; #exact}, x : Float) : Text
```

The function `format` takes two argument and returns a `Text` value. 

```motoko
{{#include _mo/float.mo:j}}
```

<!-- - type Float

- sqrt
- ceil
- floor
- toText
- toInt64
- fromInt64
- toInt
- fromInt

Bonus:
- format -->