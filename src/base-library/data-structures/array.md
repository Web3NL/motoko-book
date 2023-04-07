> **BETA WARNING** _This chapter is being reviewed and updated_

# Array

The _convention_ is to name the _module alias_ after the _file name_ it is defined in:

```motoko
{{#include _mo/array.mo:a}}
```

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

```motoko
func size<X>(array : [X]) : Nat
```

| **Parameters**     |               |
| ------------------ | ------------- |
| Generic parameters | `X`           |
| Variable argument  | `array : [X]` |
| Return type        | `Nat`         |

### Example

```motoko, run
{{#include _mo/array/size.mo:a}}
```

## Array.init

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

### Example

```motoko, run
{{#include _mo/array/init.mo:a}}
```

## Array.make

```motoko
func make<X>(element : X) : [x]
```

| **Parameters**     |               |
| ------------------ | ------------- |
| Generic parameters | `X`           |
| Variable argument  | `element : X` |
| Return type        | `[X]`         |

### Example

```motoko, run
{{#include _mo/array/make.mo:a}}
```

## Array.tabulate

The `tabulate` function generates an _immutable array_ of predefined `size` by using a generator function that takes the index of every element as an argument and produces the elements of the array.

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

### Example

```motoko, run
{{#include _mo/array/tabulate.mo:a}}
```

## Array.tabulateVar

The `tabulateVar` function generates an _mutable array_ of predefined `size` by using a generator function that takes the index of every element as an argument and produces the elements of the array.

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

### Example

```motoko, run
{{#include _mo/array/tabulateVar.mo:a}}
```

## Array.freeze

```motoko
func freeze<X>(varArray : [var X]) : [X]
```

| **Parameters**     |                      |
| ------------------ | -------------------- |
| Generic parameters | `X`                  |
| Variable argument  | `varArray : [var X]` |
| Return type        | `[X]`                |

### Example

```motoko, run
{{#include _mo/array/freeze.mo:a}}
```

## Array.thaw

```motoko
func thaw<X>(array : [X]) : [var X]
```

| **Parameters**     |               |
| ------------------ | ------------- |
| Generic parameters | `X`           |
| Variable argument  | `array : [X]` |
| Return type        | `[var X]`     |

### Example

```motoko, run
{{#include _mo/array/thaw.mo:a}}
```

## Array.sort

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

### Example

```motoko, run
{{#include _mo/array/sort.mo:a}}
```

| Index | `array1 : [Nat]` | `array2 : [Nat]` |
| ----- | ---------------- | ---------------- |
| 0     | 50               | 10               |
| 1     | 40               | 20               |
| 2     | 30               | 30               |
| 3     | 20               | 40               |
| 4     | 10               | 50               |

## Array.sortInPlace

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

### Example

```motoko, run
{{#include _mo/array/sortInPlace.mo:a}}
```

## Array.reverse

```motoko
func reverse<X>(array : [X]) : [X]
```

| **Parameters**     |               |
| ------------------ | ------------- |
| Generic parameters | `X`           |
| Variable argument  | `array : [X]` |
| Return type        | `[X]`         |

### Example

```motoko, run
{{#include _mo/array/reverse.mo:a}}
```

| Index | `array1 : [Text]` | `array2 : [Text]` |
| ----- | ----------------- | ----------------- |
| 0     | "first"           | "third"           |
| 1     | "second"          | "second"          |
| 2     | "third"           | "first"           |

## Array.flatten

```motoko
func flatten<X>(arrays : [[X]]) : [x]
```

| **Parameters**     |                  |
| ------------------ | ---------------- |
| Generic parameters | `X`              |
| Variable argument  | `arrays : [[X]]` |
| Return type        | `[X]`            |

### Example

```motoko, run
{{#include _mo/array/flatten.mo:a}}
```

## Array.equal

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

### Example

```motoko, run
{{#include _mo/array/equal.mo:a}}
```

## Array.map

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

### Example

```motoko, run
{{#include _mo/array/map.mo:a}}
```

| Index | `array1 : [Bool]` | `array2 : [Bool]` |
| ----- | ----------------- | ----------------- |
| 0     | true              | false             |
| 1     | false             | true              |
| 2     | true              | false             |
| 3     | false             | true              |

## Array.filter

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

### Example

```motoko, run
{{#include _mo/array/filter.mo:a}}
```

| Index | `array1 : [Nat]` | `array2 : [Nat]` |
| ----- | ---------------- | ---------------- |
| 0     | 1                | 2                |
| 1     | 2                | 6                |
| 2     | 5                |                  |
| 3     | 6                |                  |
| 4     | 9                |                  |
| 5     | 7                |                  |

## Array.mapEntries

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

### Example

```motoko, run
{{#include _mo/array/mapEntries.mo:a}}
```

| Index | `array1 : [Int]` | `array2 : [Int]` |
| ----- | ---------------- | ---------------- |
| 0     | -1               | 0                |
| 1     | -2               | -2               |
| 2     | -3               | -6               |
| 3     | -4               | -12              |

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

### Example

```motoko, run
{{#include _mo/array/mapFilter.mo:a}}
```

| Index | `array1 : [Nat]` | `array2 : [Text]` |
| ----- | ---------------- | ----------------- |
| 0     | 1                | "100"             |
| 1     | 2                | "50"              |
| 2     | 4                | "25"              |
| 3     | 5                | "20"              |

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

### Example

```motoko, run
{{#include _mo/array/mapResult.mo:a}}
```

| Index | `array1 : [Nat]` | `array2 : [Nat]` |
| ----- | ---------------- | ---------------- |
| 0     | 4                | 25               |
| 1     | 5                | 20               |
| 2     | 2                | 50               |
| 3     | 1                | 100              |

## Array.vals

```motoko
func vals<X>(array : [X]) : I.Iter<X>
```

| **Parameters**     |               |
| ------------------ | ------------- |
| Generic parameters | `X`           |
| Variable argument  | `array : [X]` |
| Return type        | `I.Iter<X>`   |

### Example

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

### Example

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

### Example

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

### Example

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

### Example

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

### Example

```motoko, run
{{#include _mo/array/foldRight.mo:a}}
```
