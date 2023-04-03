# Bool

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko, run
{{#include _mo/bool.mo:a}}
```

### Comparison

[Function `equal`](#boolequal)  
[Function `notEqual`](#boolnotequal)  
[Function `compare`](#boolcompare)

### Conversion

[Function `toText`](#booltotext)

### Logical operations

[Function `lognot`](#boollognot)  
[Function `logand`](#boollogand)  
[Function `logor`](#boollogor)  
[Function `logxor`](#boollogxor)

## Bool.equal

```motoko
func equal(x : Bool, y : Bool) : Bool
```

The function `equal` takes two `Bool` arguments and returns a `Bool` value. It is equivalent to the `==` [relational operator](/common-programming-concepts/operators/relational-operators.html).

```motoko, run
{{#include _mo/bool5.mo:a}}
```

## Bool.notEqual

```motoko
func notEqual(x : Bool, y : Bool) : Bool
```

The function `notEqual` takes two `Bool` arguments and returns a `Bool` value. It is equivalent to the `!=` [relational operator](/common-programming-concepts/operators/relational-operators.html).

```motoko, run
{{#include _mo/bool4.mo:a}}
```

## Bool.compare

```motoko
func compare(x : Bool, y : Bool) : Order.Order
```

The function `compare` takes two `Bool` arguments and returns an [Order](/base-library/utils/order.html) variant value.

```motoko, run
{{#include _mo/bool7.mo:a}}
```

## Bool.toText

```motoko
func toText(x : Bool) : Text
```

The function `toText` takes one `Bool` argument and returns a `Text` value.

```motoko, run
{{#include _mo/bool6.mo:a}}
```

## Bool.lognot

```motoko
func lognot(x : Bool) : Bool
```

The function `lognot` takes one `Bool` argument and returns a `Bool` value. It stands for _logical not_. It is equivalent to the `not` [expression](/common-programming-concepts/operators/logical-expressions.html#not-expression).

```motoko, run
{{#include _mo/bool8.mo:a}}
```

## Bool.logand

```motoko
func logand(x : Bool, y : Bool) : Bool
```

The function `logand` takes two `Bool` arguments and returns a `Bool` value. It stands for _logical and_. It is equivalent to the `and` [expression](/common-programming-concepts/operators/logical-expressions.html#and-expression).

```motoko, run
{{#include _mo/bool1.mo:a}}
```

## Bool.logor

```motoko
func logor(x : Bool, y : Bool) : Bool
```

The function `logor` takes two `Bool` arguments and returns a `Bool` value. It stands for _logical or_. It is equivalent to the `or` [expression](/common-programming-concepts/operators/logical-expressions.html#or-expression).

```motoko, run
{{#include _mo/bool2.mo:a}}
```

## Bool.logxor

```motoko
func logxor(x : Bool, y : Bool) : Bool
```

The function `logxor` takes two `Bool` arguments and returns a `Bool` value. It stands for _exclusive or_.

```motoko, run
{{#include _mo/bool3.mo:a}}
```
