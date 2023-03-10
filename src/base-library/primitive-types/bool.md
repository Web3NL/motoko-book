# Bool
The convention is to name the *module alias* after the *file name* it is defined in:

```motoko
{{#include _mo/bool.mo:a}}
```

This module is mostly used for [logical operations](https://en.wikipedia.org/wiki/Logical_connective).

## Bool.toText
The function `toText` takes one `Bool` argument and returns a `Text` value.  

```motoko
{{#include _mo/bool.mo:b}}
```

## Bool.compare
The function `compare` takes two `Bool` arguments and returns an `Order` variant value.  

```motoko
{{#include _mo/bool.mo:c}}
```

## Bool.lognot
The function `lognot` takes one `Bool` argument and returns a `Bool` value. It stands for *logical not*. It is equivalent to the `not` [operator](/common-programming-concepts/operators.html).

```motoko
{{#include _mo/bool.mo:d}}
```

## Bool.logand
The function `logand` takes two `Bool` arguments and returns a `Bool` value. It stands for *logical and*. It is equivalent to the `and` [operator](/common-programming-concepts/operators.html).

```motoko
{{#include _mo/bool1.mo:a}}
```

## Bool.logor
The function `logor` takes two `Bool` arguments and returns a `Bool` value. It stands for *logical or*. It is equivalent to the `or` [operator](/common-programming-concepts/operators.html).

```motoko
{{#include _mo/bool2.mo:a}}
```

## Bool.logxor
The function `logxor` takes two `Bool` arguments and returns a `Bool` value. It stands for *exclusive or*.

```motoko
{{#include _mo/bool3.mo:a}}
```

## Bool.notEqual
The function `notEqual` takes two `Bool` arguments and returns a `Bool` value. It is equivalent to the `!=` [operator](/common-programming-concepts/operators.html).

```motoko
{{#include _mo/bool4.mo:a}}
```

## Bool.equal
The function `equal` takes two `Bool` arguments and returns a `Bool` value. It is equivalent to the `==` [operator](/common-programming-concepts/operators.html).

```motoko
{{#include _mo/bool5.mo:a}}
```
