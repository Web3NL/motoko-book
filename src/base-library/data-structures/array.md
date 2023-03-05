# Array
<<<<<<< HEAD
The convention is to name the *module alias* after the *file name* it is defined in:
=======

The convention is to name the _module alias_ after the _file name_ it is defined in:
>>>>>>> 15ab3e96720d79e4590551f6e6a8a4e2e219a203

```motoko
{{#include _mo/array.mo:a}}
```

## Public items
<<<<<<< HEAD
The following types and functions are made public in the `Array` module:    
=======

The following types and functions are made public in the `Array` module:  
>>>>>>> 15ab3e96720d79e4590551f6e6a8a4e2e219a203
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
<<<<<<< HEAD
[Function `size`](#arraysize)  


## Array.init


## Array.tabulate


## Array.tabulateVar


## Array.freeze


## Array.thaw


## Array.equal


## Array.find


## Array.sort


## Array.sortInPlace


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
=======
[Function `size`](#arraysize)

## Array.init

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

### Time and Space Complexity
The bigger `size` is, the more *time* the function takes to run.  
The bigger `size` is, the more *memory* the function needs to run.  

## Array.tabulateVar

## Array.freeze

## Array.thaw

## Array.equal

## Array.find

## Array.sort

## Array.sortInPlace

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
>>>>>>> 15ab3e96720d79e4590551f6e6a8a4e2e219a203
