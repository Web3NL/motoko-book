> **BETA WARNING** _This chapter is being reviewed and updated_

# Iterators

The `Iter.mo` module provides useful [_classes_](/common-programming-concepts/modules.html#public-classes-in-modules) and [_public functions_](/common-programming-concepts/modules.html#public-functions-in-modules) for _iteration_ on data sequences.

An iterator in Motoko is an [object](/common-programming-concepts/objects-and-classes/objects.html) with a single method `next`. Calling `next` returns a `?T` where `T` is the type over which we are iterating. An `Iter` object is _consumed_ by calling its `next` function until it returns `null`.

We can make an `Iter<T>` from any data sequence. Most data sequences in Motoko, like `Array`, `List` and `Buffer` provide functions to make an `Iter<T>`, which can be used to iterate over their values.

The type `Iter<T>` is an [object](/common-programming-concepts/objects-and-classes/objects.html) type with one single function:

```motoko
type Iter<T> = { next : () -> ?T }
```

The `next` function takes no arguments and returns `?T` where `T` is the type of the value being iterated over.

## Example

```motoko, run
import Array "mo:base/Array";

let a : [Nat] = [1, 2, 3];
let iter = Array.vals(a);

assert(?1 == iter.next());
assert(?2 == iter.next());
assert(?3 == iter.next());
assert(null == iter.next());
```

We use the `vals` function from the `Array.mo` module to make an `Iter<Nat>` from our array. We call its `next` function three times. After that the iterator is consumed and returns `null`.

## Import

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko, run
{{#include _mo/iter/iter.mo:a}}
```

## Ranges

This module includes two classes `range` and `revRange` to make ranges (and reversed ranges) of `Nat` or `Int` respectively. Ranges may be used in a for loop:

```motoko
import Iter "mo:base/Iter";

for (i in Iter.range(0,4)) {
  // do something 5 times
};

for (i in Iter.revRange(4,0)) {
  // do something 5 times
};
```

We use the `in` keyword to iterate over the `Iter<Nat>` and bind the values to `i` in a for loop. The second for loop iterates over a `Iter<Int>`.

### On this page

[Class `range`](#class-range)

&nbsp;&nbsp;&nbsp;&nbsp;[Function `next`](#rangenext)

[Class `revRange`](#class-revrange)

&nbsp;&nbsp;&nbsp;&nbsp;[Function `next`](#revrangenext)

[Function `iterate`](#iteriterate)  
[Function `size`](#itersize)  
[Function `map`](#itermap)  
[Function `filter`](#iterfilter)  
[Function `make`](#itermake)  
[Function `fromArray`](#iterfromarray)  
[Function `fromArrayMut`](#iterfromarraymut)  
[Function `fromList`](#iterfromlist)  
[Function `toArray`](#itertoarray)  
[Function `toArrayMut`](#itertoarraymut)  
[Function `toList`](#itertolist)  
[Function `sort`](#itersort)

## Class range

```motoko
class range(x : Nat, y : Int)
```

## range.next

```motoko
func next() : ?Nat
```

```motoko, run
{{#include _mo/iter/range.mo:a}}
```

## Class revRange

```motoko
class revRange(x : Int, y : Int)
```

## revRange.next

```motoko
func next() : ?Int
```

```motoko, run
{{#include _mo/iter/revRange.mo:a}}
```

## Iter.iterate

```motoko
func iterate<A>(

  xs : Iter<A>,
   f : (A, Nat) -> ()

) : ()
```

| **Parameters**     |                      |
| ------------------ | -------------------- |
| Generic parameters | `A`                  |
| Variable argument  | `xs : Iter<A>`       |
| Function argument  | `f : (A, Nat) -> ()` |
| Return type        | `() `                |

```motoko, run
{{#include _mo/iter/iterate.mo:a}}
```

## Iter.size

```motoko
func size<A>(xs : Iter<A>) : Nat
```

| **Parameters**     |                |
| ------------------ | -------------- |
| Generic parameters | `A`            |
| Variable argument  | `xs : Iter<A>` |
| Return type        | `Nat`          |

```motoko, run
{{#include _mo/iter/size.mo:a}}
```

## Iter.map

```motoko
func map<A, B>(

  xs : Iter<A>,
   f : A -> B

) : Iter<B>
```

| **Parameters**    |                |
| ----------------- | -------------- |
| Generic parameter | `A, B`         |
| Variable argument | `xs : Iter<A>` |
| Function argument | `f : A -> B`   |
| Return type       | `Iter<B>`      |

```motoko, run
{{#include _mo/iter/map.mo:a}}
```

## Iter.filter

```motoko
func filter<A>(

  xs : Iter<A>,
   f : A -> Bool

) : Iter<A>
```

| **Parameters**     |                 |
| ------------------ | --------------- |
| Generic parameters | `A`             |
| Variable argument  | `xs : Iter<A>`  |
| Function argument  | `f : A -> Bool` |
| Return type        | `Iter<A>`       |

```motoko, run
{{#include _mo/iter/filter.mo:a}}
```

## Iter.make

```motoko
func make<A>(x : A) : Iter<A>
```

| **Parameters**     |           |
| ------------------ | --------- |
| Generic parameters | `A`       |
| Variable argument  | `x : A`   |
| Return type        | `Iter<A>` |

```motoko, run
{{#include _mo/iter/make.mo:a}}
```

## Iter.fromArray

```motoko
func fromArray<A>(xs : [A]) : Iter<A>
```

| **Parameters**     |            |
| ------------------ | ---------- |
| Generic parameters | `A`        |
| Variable argument  | `xs : [A]` |
| Return type        | `Iter<A>`  |

```motoko, run
{{#include _mo/iter/fromArray.mo:a}}
```

## Iter.fromArrayMut

```motoko
func fromArrayMut<A>(xs : [var A]) : Iter<A>
```

| **Parameters**     |                |
| ------------------ | -------------- |
| Generic parameters | `A`            |
| Variable argument  | `xs : [var A]` |
| Return type        | `Iter<A>`      |

```motoko, run
{{#include _mo/iter/fromArrayMut.mo:a}}
```

## Iter.fromList

```motoko
func fromList(xs : List<T>) : Iter
```

| **Parameters**    |                |
| ----------------- | -------------- |
| Variable argument | `xs : List<T>` |
| Return type       | `Iter`         |

```motoko, run
{{#include _mo/iter/fromList.mo:a}}
```

## Iter.toArray

```motoko
func toArray<A>(xs : Iter<A>) : [A]
```

| **Parameters**     |                |
| ------------------ | -------------- |
| Generic parameters | `A`            |
| Variable argument  | `xs : Iter<A>` |
| Return type        | `[A]`          |

```motoko, run
{{#include _mo/iter/toArray.mo:a}}
```

## Iter.toArrayMut

```motoko
func toArrayMut<A>(xs : Iter<A>) : [var A]
```

| **Parameters**     |                |
| ------------------ | -------------- |
| Generic parameters | `A`            |
| Variable argument  | `xs : Iter<A>` |
| Return type        | `[var A]`      |

```motoko, run
{{#include _mo/iter/toArrayMut.mo:a}}
```

## Iter.toList

```motoko
func list<A>(xs : Iter<A>) : List.List<A>
```

| **Parameters**     |                |
| ------------------ | -------------- |
| Generic parameters | `A`            |
| Variable argument  | `xs : Iter<A>` |
| Return type        | `List.List<A>` |

```motoko, run
{{#include _mo/iter/toList.mo:a}}
```

## Iter.sort

```motoko
func sort<A>(

     xs : Iter<A>,
compare : (A, A) -> Order.Order

) : Iter<A>
```

| **Parameters**     |                                   |
| ------------------ | --------------------------------- |
| Generic parameters | `A`                               |
| Variable argument  | `xs : Iter<A>`                    |
| Function argument  | `compare : (A, A) -> Order.Order` |
| Return type        | `Iter<A>`                         |

```motoko, run
{{#include _mo/iter/sort.mo:a}}
```
