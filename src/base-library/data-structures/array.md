> **BETA WARNING** _This chapter is being reviewed and updated_

# Array

## What is an array?

An [_immutable_](/common-programming-concepts/types/immutable-arrays.html) or [_mutable_](/common-programming-concepts/types/mutable-arrays.html) array of type `[T]` or `[var T]` is a sequence of values of type `T`. Each element can be accessed by its index, which is a `Nat` value that represents the position of the element in the array. Indexing starts at `0`. Some properties of arrays are:

- **Memory layout**  
  Arrays are stored in contiguous memory, meaning that all elements are stored next to each other in memory. This makes arrays more memory-efficient than some other data structures, like [lists](/base-library/data-structures/list.html), where elements can be scattered throughout memory.

- **Fast indexing**  
  Arrays provide constant-time access to elements by index. This is because the memory address of any element can be calculated directly from its index and the starting memory address of the array.

- **Fixed size**  
  Once an array is created, its size cannot be changed. If you need to add or remove elements, you will have to create a new array of the desired size and copy the elements. This is different from other sequence data structures like [lists](/base-library/data-structures/list.html) or [buffers](/base-library/data-structures/buffer.html) that can grow or shrink dynamically.

- **Computational cost of copying**  
  Since arrays are stored in a contiguous block of memory, copying an array requires copying all its elements to a new memory location. This can be computationally expensive, especially for large arrays.

## Import

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/array.mo:a}}
```

## `Array.mo` module public functions

### Size

[Function `size`](#arraysize)

### Initialization

[Function `init`](#arrayinit)  
[Function `make`](#arraymake)  
[Function `tabulate`](#arraytabulate)  
[Function `tabulateVar`](#arraytabulatevar)

### Transformation

[Function `freeze`](#arrayfreeze)  
[Function `thaw`](#arraythaw)  
[Function `sort`](#arraysort)  
[Function `sortInPlace`](#arraysortinplace)  
[Function `reverse`](#arrayreverse)  
[Function `flatten`](#arrayflatten)

### Comparison

[Function `equal`](#arrayequal)

### Mapping

[Function `map`](#arraymap)  
[Function `filter`](#arrayfilter)  
[Function `mapEntries`](#arraymapentries)  
[Function `mapFilter`](#arraymapfilter)  
[Function `mapResult`](#arraymapresult)

### Iteration

[Function `vals`](#arrayvals)  
[Function `keys`](#arraykeys)  
[Function `find`](#arrayfind)  
[Function `chain`](#arraychain)  
[Function `foldLeft`](#arrayfoldleft)  
[Function `foldRight`](#arrayfoldright)

## Array.size

The size of an array can be accessed my the `.size()` method:

```motoko, run
let array : [Nat] = [0, 1, 2];
array.size()
```

The module also provides a dedicated function for the size of an array.

```motoko
func size<X>(array : [X]) : Nat
```

| **Parameters**     |               |
| ------------------ | ------------- |
| Generic parameters | `X`           |
| Variable argument  | `array : [X]` |
| Return type        | `Nat`         |

```motoko, run
{{#include _mo/array/size.mo:a}}
```

## Array.init

Initialize a [mutable array](/common-programming-concepts/types/mutable-arrays.html) of type `[var X]` with a `size` and an initial value `initValue` of [generic type](/advanced-types/generics.html) `X`.

```motoko
func init<X>(

     size : Nat,
initValue : X

) : [var X]
```

| **Parameters**      |                 |
| ------------------- | --------------- |
| Generic parameters  | `X`             |
| Variable argument 1 | `size : Nat`    |
| Variable argument 2 | `initValue : X` |
| Return type         | `[var X]`       |

```motoko, run
{{#include _mo/array/init.mo:a}}
```

## Array.make

Make an [immutable](/common-programming-concepts/types/immutable-arrays.html) array with exactly one element of [generic type](/advanced-types/generics.html) `X`.

```motoko
func make<X>(element : X) : [x]
```

| **Parameters**     |               |
| ------------------ | ------------- |
| Generic parameters | `X`           |
| Variable argument  | `element : X` |
| Return type        | `[X]`         |

```motoko, run
{{#include _mo/array/make.mo:a}}
```

## Array.tabulate

The `tabulate` function generates an [_immutable array_](/common-programming-concepts/types/immutable-arrays.html) of [generic type](/advanced-types/generics.html) `X` and predefined `size` by using a generator function that takes the index of every element as an argument and produces the elements of the array.

```motoko
func tabulate<X>(

     size : Nat,
generator : Nat -> X

) : [X]
```

| **Parameters**     |                        |
| ------------------ | ---------------------- |
| Generic parameters | `X`                    |
| Variable argument  | `size : Nat`           |
| Function argument  | `generator : Nat -> X` |
| Return type        | `[X]`                  |

```motoko, run
{{#include _mo/array/tabulate.mo:a}}
```

## Array.tabulateVar

The `tabulateVar` function generates a [_mutable array_](/common-programming-concepts/types/mutable-arrays.html) of [generic type](/advanced-types/generics.html) `X` and predefined `size` by using a generator function that takes the index of every element as an argument and produces the elements of the array.

```motoko
func tabulateVar<X>(

     size : Nat,
generator : Nat -> X

) : [var X]
```

| **Parameters**     |                        |
| ------------------ | ---------------------- |
| Generic parameters | `X`                    |
| Variable argument  | `size : Nat`           |
| Function argument  | `generator : Nat -> X` |
| Return type        | `[var X]`              |

```motoko, run
{{#include _mo/array/tabulateVar.mo:a}}
```

## Array.freeze

Freeze converts a [mutable array](/common-programming-concepts/types/mutable-arrays.html) of [generic type](/advanced-types/generics.html) `X` to a [immutable array](/common-programming-concepts/types/immutable-arrays.html) of the same type.

```motoko
func freeze<X>(varArray : [var X]) : [X]
```

| **Parameters**     |                      |
| ------------------ | -------------------- |
| Generic parameters | `X`                  |
| Variable argument  | `varArray : [var X]` |
| Return type        | `[X]`                |

```motoko, run
{{#include _mo/array/freeze.mo:a}}
```

## Array.thaw

Thaw converts an [immutable array](/common-programming-concepts/types/immutable-arrays.html) of [generic type](/advanced-types/generics.html) `X` to a [mutable array](/common-programming-concepts/types/mutable-arrays.html) of the same type.

```motoko
func thaw<X>(array : [X]) : [var X]
```

| **Parameters**     |               |
| ------------------ | ------------- |
| Generic parameters | `X`           |
| Variable argument  | `array : [X]` |
| Return type        | `[var X]`     |

```motoko, run
{{#include _mo/array/thaw.mo:a}}
```

## Array.sort

Sort takes an [immutable array](/common-programming-concepts/types/immutable-arrays.html) of [generic type](/advanced-types/generics.html) `X` and produces a second array which is sorted according to a comparing function `compare`. This comparing function compares two elements of type `X` and returns an [`Order`](/base-library/utils/order.html) type that is used to sort the array.

We could use a comparing function from the Base Library, like in the example below, or write our own custom comparing function, as long as its type is `(X, X) -> Order.Order`

```motoko
func sort<X>(

   array : [X],
 compare : (X, X) -> Order.Order

) : [X]
```

| **Parameters**     |                                   |
| ------------------ | --------------------------------- |
| Generic parameters | `X`                               |
| Variable argument  | `array : [X]`                     |
| Function argument  | `compare : (X, X) -> Order.Order` |
| Return type        | `[X]`                             |

```motoko, run
{{#include _mo/array/sort.mo:a}}
```

| Index | `ages : [Nat]` | `sortedAges : [Nat]` |
| ----- | -------------- | -------------------- |
| 0     | 50             | 10                   |
| 1     | 20             | 20                   |
| 2     | 10             | 30                   |
| 3     | 30             | 40                   |
| 4     | 40             | 50                   |

## Array.sortInPlace

We can also 'sort in place', which behaves the same as [`sort`](#arraysort) except we mutate a [mutable array](/common-programming-concepts/types/mutable-arrays.html) in stead of producing a new array. Note the function returns unit type `()`.

```motoko
func sortInPlace<X>(

   array : [var X],
 compare : (X, X) -> Order.Order

) : ()
```

| **Parameters**     |                                   |
| ------------------ | --------------------------------- |
| Generic parameters | `X`                               |
| Variable argument  | `array : [var X]`                 |
| Function argument  | `compare : (X, X) -> Order.Order` |
| Return type        | `()`                              |

```motoko, run
{{#include _mo/array/sortInPlace.mo:a}}
```

| Index | `ages : [var Nat]` | `ages : [var Nat]` |
| ----- | ------------------ | ------------------ |
| 0     | 50                 | 10                 |
| 1     | 20                 | 20                 |
| 2     | 10                 | 30                 |
| 3     | 30                 | 40                 |
| 4     | 40                 | 50                 |

## Array.reverse

Takes an [immutable array](/common-programming-concepts/types/immutable-arrays.html) and produces a second array with elements in reversed order.

```motoko
func reverse<X>(array : [X]) : [X]
```

| **Parameters**     |               |
| ------------------ | ------------- |
| Generic parameters | `X`           |
| Variable argument  | `array : [X]` |
| Return type        | `[X]`         |

```motoko, run
{{#include _mo/array/reverse.mo:a}}
```

| Index | `rank : [Text]` | `reverse : [Text]` |
| ----- | --------------- | ------------------ |
| 0     | "first"         | "third"            |
| 1     | "second"        | "second"           |
| 2     | "third"         | "first"            |

## Array.flatten

Takes an array of arrays and produces a single array, while retaining the original ordering of the elements.

```motoko
func flatten<X>(arrays : [[X]]) : [X]
```

| **Parameters**     |                  |
| ------------------ | ---------------- |
| Generic parameters | `X`              |
| Variable argument  | `arrays : [[X]]` |
| Return type        | `[X]`            |

```motoko, run
{{#include _mo/array/flatten.mo:a}}
```

| Index | `arrays : [[Char]]` | `newArray : [Char]` |
| ----- | ------------------- | ------------------- |
| 0     | `['a', 'b']`        | `'a'`               |
| 1     | `['c', 'd']`        | `'b'`               |
| 2     | `['e']`             | `'c'`               |
| 3     |                     | `'d'`               |
| 4     |                     | `'e'`               |

## Array.equal

Compare each element of two arrays and check whether they are all equal according to an `equal` function of type `(X, X) -> Bool`.

```motoko
func equal<X>(

  array1 : [X],
  array2 : [X],
   equal : (X, X) -> Bool

) : Bool
```

| **Parameters**     |                          |
| ------------------ | ------------------------ |
| Generic parameters | `X`                      |
| Variable argument1 | `array1 : [X]`           |
| Variable argument2 | `array2 : [X]`           |
| Function argument  | `equal : (X, X) -> Bool` |
| Return type        | `Bool`                   |

```motoko, run
{{#include _mo/array/equal.mo:a}}
```

## Array.map

The mapping function `map` iterates through each element of an [immutable array](/common-programming-concepts/types/immutable-arrays.html), applies a given transformation function `f` to it, and creates a new array with the transformed elements. The input array is of [generic type](/advanced-types/generics.html) `[X]`, the transformation function takes elements of type `X` and returns elements of type `Y`, and the resulting array is of type `[Y]`.

```motoko
func map<X>(

array : [X],
    f : X -> Y

) : [Y]
```

| **Parameters**     |               |
| ------------------ | ------------- |
| Generic parameters | `X`           |
| Variable argument  | `array : [X]` |
| Function argument  | `f : X -> Y`  |
| Return type        | `[Y]`         |

```motoko, run
{{#include _mo/array/map.mo:a}}
```

| Index | `array1 : [Bool]` | `array2 : [Nat]` |
| ----- | ----------------- | ---------------- |
| 0     | true              | 1                |
| 1     | false             | 0                |
| 2     | true              | 1                |
| 3     | false             | 0                |

## Array.filter

The `filter` function takes an [immutable array](/common-programming-concepts/types/immutable-arrays.html) of elements of [generic type](/advanced-types/generics.html) `X` and a predicate function `predicate` (that takes a `X` and returns a `Bool`) and returns a new array containing only the elements that satisfy the predicate condition.

```motoko
func filter<X>(

    array : [X],
predicate : X -> Bool

) : [X]
```

| **Parameters**     |                         |
| ------------------ | ----------------------- |
| Generic parameters | `X`                     |
| Variable argument  | `array : [X]`           |
| Function argument  | `predicate : X -> Bool` |
| Return type        | `[X]`                   |

```motoko, run
{{#include _mo/array/filter.mo:a}}
```

| Index | `ages : [Nat]` | `evenAges : [Nat]` |
| ----- | -------------- | ------------------ |
| 0     | 1              | 2                  |
| 1     | 2              | 6                  |
| 2     | 5              |                    |
| 3     | 6              |                    |
| 4     | 9              |                    |
| 5     | 7              |                    |

## Array.mapEntries

The `mapEntries` function takes an [immutable array](/common-programming-concepts/types/immutable-arrays.html) of elements of [generic type](/advanced-types/generics.html) `[X]` and a function `f` that accepts an element and its index (a `Nat` value) as arguments, then returns a new array of type `[Y]` with elements transformed by applying the function `f` to each element and its index.

```motoko
func mapEntries<X,Y>(

array : [X],
    f : (X, Nat) -> Y

) : [Y]
```

| **Parameters**     |                     |
| ------------------ | ------------------- |
| Generic parameters | `X, Y`              |
| Variable argument  | `array : [X]`       |
| Function argument  | `f : (X, Nat) -> Y` |
| Return type        | `[Y]`               |

```motoko, run
{{#include _mo/array/mapEntries.mo:a}}
```

| Index | `array1 : [Int]` | `array2 : [Text]` |
| ----- | ---------------- | ----------------- |
| 0     | -1               | `"-1; 0"`         |
| 1     | -2               | `"-2; 1"`         |
| 2     | -3               | `"-3; 2"`         |
| 3     | -4               | `"-4; 3"`         |

## Array.mapFilter

```motoko
func mapFilter<X,Y>(

   array : [X],
       f : X -> ?Y

) : [Y]
```

| **Parameters**     |               |
| ------------------ | ------------- |
| Generic parameters | `X, Y`        |
| Variable argument  | `array : [X]` |
| Function argument  | `f : X -> ?Y` |
| Return type        | `[Y]`         |

```motoko, run
{{#include _mo/array/mapFilter.mo:a}}
```

| Index | `array1 : [Nat]` | `array2 : [Text]` |
| ----- | ---------------- | ----------------- |
| 0     | 1                | "100"             |
| 1     | 2                | "50"              |
| 2     | 3                | "33"              |
| 3     | 4                |                   |
| 3     | 5                |                   |

## Array.mapResult

```motoko
func mapResult<X, Y, E>(

  array : [X],
      f : X -> Result.Result<Y, E>

) : Result.Result<[Y], E>
```

| **Parameters**     |                                |
| ------------------ | ------------------------------ |
| Generic parameters | `X, Y, E`                      |
| Variable argument  | `array : [X]`                  |
| Function argument  | `f : X -> Result.Result<Y, E>` |
| Return type        | `Result.Result<[Y], E>`        |

```motoko, run
{{#include _mo/array/mapResult.mo:a}}
```

| Index | `array1 : [Nat]` | `mapResult : #ok : [Nat]` |
| ----- | ---------------- | ------------------------- |
| 0     | 4                | 25                        |
| 1     | 5                | 20                        |
| 2     | 2                | 50                        |
| 3     | 1                | 100                       |

## Array.vals

```motoko
func vals<X>(array : [X]) : I.Iter<X>
```

| **Parameters**     |               |
| ------------------ | ------------- |
| Generic parameters | `X`           |
| Variable argument  | `array : [X]` |
| Return type        | `I.Iter<X>`   |

```motoko, run
{{#include _mo/array/vals.mo:a}}
```

## Array.keys

```motoko
func keys<X>(array : [X]) : I.Iter<Nat>
```

| **Parameters**     |               |
| ------------------ | ------------- |
| Generic parameters | `X`           |
| Variable argument  | `array : [X]` |
| Return type        | `I.Iter<Nat>` |

```motoko, run
{{#include _mo/array/keys.mo:a}}
```

## Array.find

```motoko
func find<X>(

    array : [X],
predicate : X -> Bool

) : ?X
```

| **Parameters**     |                         |
| ------------------ | ----------------------- |
| Generic parameters | `X`                     |
| Variable argument  | `array : [X]`           |
| function argument  | `predicate : X -> Bool` |
| Return type        | `?X`                    |

```motoko, run
{{#include _mo/array/find.mo:a}}
```

## Array.chain

```motoko
func chain<X, Y>(

  array : [X],
      k : X -> [Y]

) : [Y]
```

| **Parameters**     |                |
| ------------------ | -------------- |
| Generic parameters | `X, Y`         |
| Variable argument  | `array : [X]`  |
| Function argument  | `k : X -> [Y]` |
| Return type        | `[Y]`          |

```motoko, run
{{#include _mo/array/chain.mo:a}}
```

| Index | `array1 : [Nat]` | `array2 : [Int]` |
| ----- | ---------------- | ---------------- |
| 0     | 10               | 10               |
| 1     | 20               | -10              |
| 2     | 30               | 20               |
| 3     |                  | -20              |
| 4     |                  | 30               |
| 5     |                  | -30              |

## Array.foldLeft

```motoko
func foldLeft<X, A>(

  array : [X],
   base : A,
combine : (A, X) -> A

) : A
```

| **Parameters**     |                         |
| ------------------ | ----------------------- |
| Generic parameters | `X, A`                  |
| Variable argument1 | `array : [X]`           |
| Variable argument2 | `base : A`              |
| Function argument  | `combine : (A, X) -> A` |
| Return type        | `A`                     |

```motoko, run
{{#include _mo/array/foldLeft.mo:a}}
```

## Array.foldRight

```motoko
func foldRight<X, A>(

  array : [X],
   base : A,
combine : (X, A) -> A

) : A
```

| **Parameters**     |                         |
| ------------------ | ----------------------- |
| Generic parameters | `X, A`                  |
| Variable argument1 | `array : [X]`           |
| Variable argument2 | `base : A`              |
| Function argument  | `combine : (X, A) -> A` |
| Return type        | `A`                     |

```motoko, run
{{#include _mo/array/foldRight.mo:a}}
```
