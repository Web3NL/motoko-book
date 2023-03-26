# Int
The *convention* is to name the [*module alias*](/common-programming-concepts/modules.html#imports) after the [*file name*](/common-programming-concepts/modules.html#imports) it is defined in:
```motoko
{{#include _mo/int.mo:a}}
```

### Numerical operations
[Function `abs`](#intabs)    

### Conversion
[Function `toText`](#inttotext)  

### Comparison
[Function `min`](#intmin)  
[Function `max`](#intmax)  
[Function `compare`](#intcompare)  

## Int.abs
```motoko,
func abs(x : Int) : Nat
```

The function `abs` takes one `Int` argument and returns a `Nat` value. 
```motoko, run
{{#include _mo/int4.mo:a}}
```

## Int.toText
```motoko,
func toText(x : Int) : Text
```

The function `toText` takes one `Int` argument and returns a `Text` value.  
```motoko, run
{{#include _mo/int3.mo:a}}
```

## Int.min
```motoko,
func min(x : Int, y : Int) : Int
```

The function `min` takes two `Int` arguments and returns an `Int` value. 
```motoko, run
{{#include _mo/int5.mo:a}}
```

## Int.max
```motoko,
func max(x : Int, y : Int) : Int
```

The function `max` takes two `Int` arguments and returns an `Int` value. 
```motoko, run
{{#include _mo/int1.mo:a}}
```

## Int.compare
```motoko,
func compare(x : Int, y : Int) : {#less; #equal; #greater}
```

The function `compare` takes two `Int` arguments and returns an [Order](/base-library/utils/order.html) variant value.

```motoko, run
{{#include _mo/int2.mo:a}}
```