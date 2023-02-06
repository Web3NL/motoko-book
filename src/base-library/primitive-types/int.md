
# Int
The convention is to name the *module alias* after the *file name* it is defined in:

```motoko
{{#include _mo/int.mo:a}}
```

## int.abs
The function `abs` takes one `int` argument and returns a `int` value. 

```motoko
{{#include _mo/int.mo:b}}
```


## int.toText
The function `toText` takes one `int` argument and returns a `Text` value.  

```motoko
{{#include _mo/int.mo:c}}
```

## int.min
The function `min` takes two `int` arguments and returns a `int` value. 

```motoko
{{#include _mo/int.mo:d}}
```

## int.max
The function `max` takes two `int` arguments and returns a `int` value. 

```motoko
{{#include _mo/int.mo:e}}
```

## int.compare
The function `compare` takes two `int` arguments and returns an `Order` variant value.  

```motoko
{{#include _mo/int.mo:f}}
```