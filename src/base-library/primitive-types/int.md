# Int
The convention is to name the *module alias* after the *file name* it is defined in:

```motoko
{{#include _mo/int.mo:a}}
```

## Public items
The following types and functions are made public in the `Int` module:  
[Type Int](#type)  
[Function `abs`](#intabs)    
[Function `toText`](#inttotext)  
[Function `min`](#intmin)  
[Function `max`](#intmax)  
[Function `compare`](#intcompare)  


## Type
```motoko
type Int = Int.Int
```

## Int.abs
The function `abs` takes one `Int` argument and returns an `Int` value. 

```motoko
{{#include _mo/int.mo:b}}
```


## Int.toText
The function `toText` takes one `Int` argument and returns a `Text` value.  

```motoko
{{#include _mo/int.mo:c}}
```

## Int.min
The function `min` takes two `Int` arguments and returns an `Int` value. 

```motoko
{{#include _mo/int.mo:d}}
```

## Int.max
The function `max` takes two `Int` arguments and returns an `Int` value. 

```motoko
{{#include _mo/int1.mo:a}}
```

## Int.compare
The function `compare` takes two `Int` arguments and returns an [Order](/base-library/utils/order.html) variant value.  

```motoko
{{#include _mo/int2.mo:a}}
```