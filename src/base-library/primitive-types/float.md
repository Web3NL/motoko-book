
# Float
The convention is to name the *module alias* after the *file name* it is defined in:

```motoko
{{#include _mo/float.mo:a}}
```

## Public items
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
The function `toInt` takes one `Float` argument and returns an `Int` value. 

```motoko
{{#include _mo/float.mo:b}}
```

## Float.sqrt
The function `sqrt` takes one `Float` argument and returns a `Float` value. 

```motoko
{{#include _mo/float.mo:c}}
```

## Float.ceil
The function `ceil` takes one `Float` argument and returns a `Float` value. 

```motoko
{{#include _mo/float.mo:d}}
```

## Float.floor
The function `floor` takes one `Float` argument and returns a `Float` value. 

```motoko
{{#include _mo/float.mo:e}}
```

## Float.fromInt
The function `fromInt` takes one `Int` argument and returns a `Float` value. 

```motoko
{{#include _mo/float.mo:f}}
```

## Float.toText
The function `toText` takes one `Float` argument and returns a `Text` value. 

```motoko
{{#include _mo/float.mo:g}}
```

## Float.toInt64
The function `toInt64` takes one `Float` argument and returns an `Int64` value. 

```motoko
{{#include _mo/float.mo:h}}
```

## Float.fromInt64
The function `fromInt64` takes one `Int64` argument and returns a `Float` value. 

```motoko
{{#include _mo/float.mo:i}}
```

## Float.format
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