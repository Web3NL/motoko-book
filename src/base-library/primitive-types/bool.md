# Bool
The convention is to name the *module alias* after the *file name* it is defined in:
```motoko
{{#include _mo/bool.mo:a}}
```

**Public Types**  
[Type Bool](#type)  

**Comparison**  
[Function `equal`](#boolequal)  
[Function `notEqual`](#boolnotequal)  
[Function `compare`](#boolcompare)  

**Conversion**  
[Function `toText`](#booltotext)  

**Logical operations**  
[Function `lognot`](#boollognot)  
[Function `logand`](#boollogand)  
[Function `logor`](#boollogor)  
[Function `logxor`](#boollogxor)  
 
 


## Type
```motoko
type Bool = Bool.Bool
```

## Bool.equal
```motoko
func equal(x : Bool, y : Bool) : Bool
```

The function `equal` takes two `Bool` arguments and returns a `Bool` value. It is equivalent to the `==` [relational operator](/common-programming-concepts/operators.html#relational-operators).

```motoko
{{#include _mo/bool5.mo:a}}
```

## Bool.notEqual

```motoko
func notEqual(x : Bool, y : Bool) : Bool
```

The function `notEqual` takes two `Bool` arguments and returns a `Bool` value. It is equivalent to the `!=` [operator](/common-programming-concepts/operators.html).

```motoko
{{#include _mo/bool4.mo:a}}
```

## Bool.compare

```motoko
func compare(x : Bool, y : Bool) : {#less; #equal; #greater}
```

The function `compare` takes two `Bool` arguments and returns an [Order](/base-library/utils/order.html) variant value.  

```motoko
{{#include _mo/bool.mo:c}}
```


## Bool.toText

```motoko
func toText(x : Bool) : Text
```

The function `toText` takes one `Bool` argument and returns a `Text` value.  

```motoko
{{#include _mo/bool.mo:b}}
```


## Bool.lognot

```motoko
func lognot(x : Bool) : Bool
```

The function `lognot` takes one `Bool` argument and returns a `Bool` value. It stands for *logical not*. It is equivalent to the `not` [operator](/common-programming-concepts/operators.html).

```motoko
{{#include _mo/bool.mo:d}}
```

## Bool.logand

```motoko
func logand(x : Bool, y : Bool) : Bool
```

The function `logand` takes two `Bool` arguments and returns a `Bool` value. It stands for *logical and*. It is equivalent to the `and` [operator](/common-programming-concepts/operators.html).

```motoko
{{#include _mo/bool1.mo:a}}
```

## Bool.logor

```motoko
func logor(x : Bool, y : Bool) : Bool
```

The function `logor` takes two `Bool` arguments and returns a `Bool` value. It stands for *logical or*. It is equivalent to the `or` [operator](/common-programming-concepts/operators.html).

```motoko
{{#include _mo/bool2.mo:a}}
```

## Bool.logxor

```motoko
func logxor(x : Bool, y : Bool) : Bool
```

The function `logxor` takes two `Bool` arguments and returns a `Bool` value. It stands for *exclusive or*.

```motoko
{{#include _mo/bool3.mo:a}}
```


