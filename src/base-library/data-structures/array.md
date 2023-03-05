# Array

The convention is to name the _module alias_ after the _file name_ it is defined in:

```motoko
{{#include _mo/array.mo:a}}
```

## Public items

The following types and functions are made public in the `Array` module:  
[Function `init`](#arrayinit)  
[Function `tabulate`](#arraytabulate)  
[Function `tabulateVar`](#arraytabulatevar)  
[Function `freeze`](#arrayfreeze)  
[Function `thaw`](#arraythaw)  
[Function `equal`](#arrayequal)  
[Function `find`](#arrayfind)  
[Function `sort`](#arraysort)  
[Function `sortInPlace`](#arraysortinplace)  
[Function `reverse`](#arrayreverse)  
[Function `map`](#arraymap)  
[Function `filter`](#arrayfilter)  
[Function `mapEntries`](#arraymapentries)  
[Function `mapFilter`](#arraymapfilter)  
[Function `mapResult`](#arraymapresult)  
[Function `chain`](#arraychain)  
[Function `foldLeft`](#arrayfoldleft)  
[Function `foldRight`](#arrayfoldright)  
[Function `flatten`](#arrayflatten)  
[Function `make`](#arraymake)  
[Function `vals`](#arrayvals)  
[Function `keys`](#arraykeys)  
[Function `size`](#arraysize)

## Array.init

### Function signature

```motoko
func init<X>(

    size : Nat,
    initValue : X

) : [var X]
```

### Parameters

|                     |                        |
| ------------------- | ---------------------- |
| Generic parameters  | `X`                    |
| Variable argument 1 | `size : Nat`           |
| Variable argument 2 | `initValue : X`        |
| Return type         | `[var X]`              |

### Example

```motoko
{{#include _mo/array/init.mo:a}}
```

### Execution Time and Memory Usage
The bigger `size` is, the more *time* the function takes to run.  
The bigger `size` is, the more *memory* the function needs to run.  


## Array.tabulate

The `tabulate` function generates an _immutable array_ of predefined `size` by using a generator function that takes the index of every element as an argument and produces the elements of the array.

### Function signature

```motoko
func tabulate<X>(

    size : Nat,
    generator : Nat -> X

) : [X]
```

### Parameters

|                     |                        |
| ------------------- | ---------------------- |
| Generic parameters  | `X`                    |
| Variable argument 1 | `size : Nat`           |
| Function argument 1 | `generator : Nat -> X` |
| Return type         | `[X]`                  |

### Example

```motoko
{{#include _mo/array/tabulate.mo:a}}
```

### Execution Time and Memory Usage
The bigger `size` is, the more *time* the function takes to run.  
The bigger `size` is, the more *memory* the function needs to run.  


## Array.tabulateVar

The `tabulateVar` function generates an _mutable array_ of predefined `size` by using a generator function that takes the index of every element as an argument and produces the elements of the array.

### Function signature

```motoko
func tabulateVar<X>(

    size : Nat,
    generator : Nat -> X

) : [var X]
```

### Parameters

|                     |                        |
| ------------------- | ---------------------- |
| Generic parameters  | `X`                    |
| Variable argument 1 | `size : Nat`           |
| Function argument 1 | `generator : Nat -> X` |
| Return type         | `[var X]`              |

### Example

```motoko
{{#include _mo/array/tabulateVar.mo:a}}
```

### Execution Time and Memory Usage
The bigger `size` is, the more *time* the function takes to run.  
The bigger `size` is, the more *memory* the function needs to run.  



## Array.freeze

### Function signature

```motoko
func freeze<X>(

  varArray : [var X]

) : [X]
```

### Parameters

|                     |                              |
| ------------------- | ----------------------       |
| Generic parameters  | `X`                          |
| Variable argument   | `varArray : [var X]`         |
| Return type         | `[X]`                        |

### Example

```motoko
{{#include _mo/array/freeze.mo:a}}
```

### Execution Time and Memory Usage
The bigger `size` is, the more *time* the function takes to run.  
The bigger `size` is, the more *memory* the function needs to run.  

## Array.thaw

### Function signature

```motoko
func thaw<X>(

  array : [X]

) : [var X]
```

### Parameters

|                     |                              |
| ------------------- | ----------------------       |
| Generic parameters  | `X`                          |
| Variable argument   | `array : [X]`                |
| Return type         | `[var X]`                    |

### Example

```motoko
{{#include _mo/array/thaw.mo:a}}
```

### Execution Time and Memory Usage
The bigger `size` is, the more *time* the function takes to run.  
The Array.thaw method needs to allocate space for the new mutable array, which has the same size as the input array. However, it does not need to allocate any additional memory proportional to the size of the input array. This means that the space complexity of Array.thaw is O(1). 


## Array.equal

### Function signature

```motoko
func equal<X>(

  array1 : [X]
  
  array2 : [X]

   equal : (X, X) -> Bool

) : Bool 
```

### Parameters

|                      |                              |
| -------------------  | ----------------------       |
| Generic parameters   | `X`                          |
| Variable argument1   | `array1 : [X]`               |
| Variable argument2   | `array2 : [X]`               |
| function argument    |  `equal : (X, X) -> Bool`    |
| Return type          | `Bool`                       |

### Example

```motoko
{{#include _mo/array/equal.mo:a}}
```

### Execution Time and Memory Usage


## Array.find

### Function signature

```motoko
func find<X>(

  array : [X]

  predicate : X -> Bool

) : ?X
```

### Parameters

|                     |                              |
| ------------------- | ----------------------       |
| Generic parameters  | `X`                          |
| Variable argument   |     `array : [X]`            |
| function argument   | `predicate : X -> Bool`      |
| Return type         | `?X`                         |

### Example

```motoko
{{#include _mo/array/find.mo:a}}
```

### Execution Time and Memory Usage


## Array.sort

### Function signature

```motoko
func sort<X>(

   array : [X]
  
 compare : (X, X) -> Order.Order

) : [X]
```

### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `array : [X]`                       |
| function argument   | `compare : (X, X) -> Order.Order`   |
| Return type         | `[X]`                           |

### Example

```motoko
{{#include _mo/array/sort.mo:a}}
```

### Execution Time and Memory Usage


## Array.sortInPlace

### Function signature

```motoko
func sortInPlace<X>(

   array : [var X]
  
 compare : (X, X) -> Order.Order

) : [X]
```

### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `array : [var X]`                       |
| function argument   | `compare : (X, X) -> Order.Order`   |
| Return type         | `[X]`                           |

### Example

```motoko
{{#include _mo/array/sortInPlace.mo:a}}
```

### Execution Time and Memory Usage


## Array.reverse

## Array.map

## Array.filter

## Array.mapEntries

## Array.mapFilter

## Array.mapResult

## Array.chain

## Array.foldLeft

## Array.foldRight

## Array.flatten

## Array.make

## Array.vals

## Array.keys

## Array.size
