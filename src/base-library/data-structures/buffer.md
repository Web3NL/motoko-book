> **BETA WARNING** _This chapter is being reviewed and updated_

# Buffer

A Buffer in Motoko is a _growable_ data structure that houses elements of [generic type](/advanced-types/generics.html) `X`. The `Buffer` [Base Module](/base-library.html) contains a [class](/common-programming-concepts/objects-and-classes/classes.html) `Buffer` (same name as module) with [_class methods_](/common-programming-concepts/objects-and-classes/classes.html#public-functions-in-classes). The module also offers many [_public functions_](/common-programming-concepts/modules.html#public-functions-in-modules).

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko, run
{{#include _mo/buffer.mo:a}}
```

### On this page

[Type `Buffer.Buffer<X>`](#type-bufferbufferx)  
[Class `Buffer.Buffer<X>(initCapacity : Nat)`](#class-bufferbufferx)

[**Class methods**](#class-methods)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `size`](#mybuffersize)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `add`](#mybufferadd)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `get`](#mybufferget)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `getOpt`](#mybuffergetopt)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `put`](#mybufferput)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `removeLast`](#mybufferremovelast)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `remove`](#mybufferremove)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `clear`](#mybufferclear)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `filterEntries`](#mybufferfilterentries)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `capacity`](#mybuffercapacity)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `reserve`](#mybufferreserve)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `append`](#mybufferappend)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `insert`](#mybufferinsert)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `insertBuffer`](#mybufferinsertbuffer)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `sort`](#mybuffersort)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `vals`](#mybuffervals)

[**Module public functions**](#module-public-functions)  
[Function `isEmpty`](#bufferisempty)  
[Function `contains`](#buffercontains)  
[Function `clone`](#bufferclone)  
[Function `max`](#buffermax)  
[Function `min`](#buffermin)  
[Function `equal`](#bufferequal)  
[Function `compare`](#buffercompare)  
[Function `toText`](#buffertotext)  
[Function `hash`](#bufferhash)  
[Function `indexOf`](#bufferindexof)  
[Function `lastIndexOf`](#bufferlastindexof)  
[Function `indexOfBuffer`](#bufferindexofbuffer)  
[Function `binarySearch`](#bufferbinarysearch)  
[Function `subBuffer`](#buffersubbuffer)  
[Function `isSubBufferOf`](#bufferissubbufferof)  
[Function `isStrictSubBufferOf`](#bufferisstrictsubbufferof)  
[Function `prefix`](#bufferprefix)  
[Function `isPrefixOf`](#bufferisprefixof)  
[Function `isStrictPrefixOf`](#bufferisstrictprefixof)  
[Function `suffix`](#buffersuffix)  
[Function `isSuffixOf`](#bufferissuffixof)  
[Function `isStrictSuffixOf`](#bufferisstrictsuffixof)  
[Function `forAll`](#bufferforall)  
[Function `forSome`](#bufferforsome)  
[Function `forNone`](#bufferfornone)  
[Function `toArray`](#buffertoarray)  
[Function `toVarArray`](#buffertovararray)  
[Function `fromArray`](#bufferfromarray)  
[Function `fromVarArray`](#bufferfromvararray)  
[Function `fromIter`](#bufferfromiter)  
[Function `trimToSize`](#buffertrimtosize)  
[Function `map`](#buffermap)  
[Function `iterate`](#bufferiterate)  
[Function `mapEntries`](#buffermapentries)  
[Function `mapFilter`](#buffermapfilter)  
[Function `mapResult`](#buffermapresult)  
[Function `chain`](#bufferchain)  
[Function `foldLeft`](#bufferfoldleft)  
[Function `foldRight`](#bufferfoldright)  
[Function `first`](#bufferfirst)  
[Function `last`](#bufferlast)  
[Function `make`](#buffermake)  
[Function `reverse`](#bufferreverse)  
[Function `merge`](#buffermerge)  
[Function `removeDuplicates`](#bufferremoveduplicates)  
[Function `partition`](#bufferpartition)  
[Function `split`](#buffersplit)  
[Function `chunk`](#bufferchunk)  
[Function `groupBy`](#buffergroupby)  
[Function `flatten`](#bufferflatten)  
[Function `zip`](#bufferzip)  
[Function `zipWith`](#bufferzipwith)  
[Function `takeWhile`](#buffertakewhile)  
[Function `dropWhile`](#bufferdropwhile)

## Type `Buffer.Buffer<X>`

The `Buffer` module contains a [public type](/common-programming-concepts/modules.html#public-types-in-modules) `Buffer<X>` with the same name. It's convenient to [rename the type](/common-programming-concepts/modules.html#type-imports-and-renaming) locally:

```motoko
{{#include _mo/buffer/type/type.mo:a}}
```

In the first line we declare a local [type alias](/common-programming-concepts/modules.html#type-imports-and-renaming) `Buffer<X>` by referring to the type inside the module. This new local type name takes in a [generic type parameter](/advanced-types/generics.html#type-parameters-and-type-arguments) `<X>`.

In the second line we declare another local alias `BufNat` which takes no parameters. It is always a `Buffer` of `Nat`.

## Class `Buffer.Buffer<X>`

```motoko
Buffer.Buffer<X>(initCapacity : Nat)
```

The `Buffer<X>` class takes one argument `initCapacity` of type `Nat`, which represent the initial capacity of the buffer.

To construct a buffer object, we use the `Buffer` class:

```motoko, run
{{#include _mo/buffer/method/_class.mo:a}}
```

We construct an [object](/common-programming-concepts/objects-and-classes/objects.html) `myBuffer` of type `Buffer<Nat>` by calling the [class](/common-programming-concepts/objects-and-classes/classes.html) `Buffer.Buffer` with type parameter `Nat` and initial capacity `100`.

# Class methods

## myBuffer.size

```motoko
func size() : Nat
```

The function `size` takes no argument and returns a `Nat` value.

```motoko, run
{{#include _mo/buffer/method/size.mo:a}}
```

## myBuffer.add

```motoko
func add(element : X) : ()
```

The function `add` takes one generic type `X` argument and returns a `()` value.

```motoko, run
{{#include _mo/buffer/method/add.mo:a}}
```

## myBuffer.get

```motoko
func get(index : Nat) : X
```

The function `get` takes one `Nat` argument and returns a generic type value `X` .

```motoko, run
{{#include _mo/buffer/method/get.mo:a}}
```

## myBuffer.getOpt

```motoko
func getOpt(index : Nat) : ?X
```

The function `getOpt` takes one `Nat` argument and returns a generic type value `?X`.

```motoko, run
{{#include _mo/buffer/method/getOpt.mo:a}}
```

## myBuffer.put

```motoko
func put(index : Nat, element : X) : ()
```

The function `put` takes one `Nat`and one generic type `x` argument and returns a `()` value.

```motoko, run
{{#include _mo/buffer/method/put.mo:a}}
```

## myBuffer.removeLast

```motoko
func removeLast() : ?X
```

The function `removeLast` takes no argument and returns a generic type value `?X`.

```motoko, run
{{#include _mo/buffer/method/removeLast.mo:a}}
```

## myBuffer.remove

```motoko
func remove(index : Nat) : X
```

The function `remove` takes one `Nat` argument and returns a generic type value `X`.

```motoko, run
{{#include _mo/buffer/method/remove.mo:a}}
```

## myBuffer.clear

```motoko
func clear() : ()
```

The function `clear` takes no argument and returns a `()` value.

```motoko, run
{{#include _mo/buffer/method/clear.mo:a}}
```

## myBuffer.filterEntries

```motoko
func filterEntries(predicate : (Nat, X) -> Bool) : ()
```

| **Parameters**    |                    |
| ----------------- | ------------------ |
| Function argument | `(Nat, X) -> Bool` |
| Return type       | `()`               |

```motoko, run
{{#include _mo/buffer/method/filterEntries.mo:a}}
```

## myBuffer.capacity

```motoko
func capacity() : Nat
```

The function `capacity` takes no argument and returns a `Nat` value.

```motoko, run
{{#include _mo/buffer/method/capacity.mo:a}}
```

## myBuffer.reserve

```motoko
func reserve(capacity : Nat) : ()
```

The function `reserve` takes one `Nat` argument and returns a `()` value.

```motoko, run
{{#include _mo/buffer/method/reserve.mo:a}}
```

## myBuffer.append

```motoko
func append(buffer2 : Buffer<X>) : ()
```

The function `append` takes one generic type `Buffer<X>` argument and returns a `()` value.

```motoko, run
{{#include _mo/buffer/method/append.mo:a}}
```

## myBuffer.insert

```motoko
func insert(index : Nat, element : X) : ()
```

The function `insert` takes one `Nat`and one generic type `X` argument and returns a `()` value.

```motoko, run
{{#include _mo/buffer/method/insert.mo:a}}
```

## myBuffer.insertBuffer

```motoko
func insertBuffer(index : Nat, buffer2 : Buffer<X>) : ()
```

The function `insertBuffer` takes one `Nat`and one generic type `Buffer<X>` argument and returns a `()` value.

```motoko, run
{{#include _mo/buffer/method/insertBuffer.mo:a}}
```

## myBuffer.sort

```motoko
func sort(compare : (X, X) -> Order.Order) : ()
```

| **Parameters**    |                         |
| ----------------- | ----------------------- |
| Function argument | `(X, X) -> Order.Order` |
| Return type       | `()`                    |

```motoko, run
{{#include _mo/buffer/method/sort.mo:a}}
```

## myBuffer.vals

```motoko
func vals() : { next : () -> ?X }
```

The function `vals` takes no argument and returns a `Iter` value.

```motoko, run
{{#include _mo/buffer/method/vals.mo:a}}
```

# Module public functions

## Buffer.isEmpty

```motoko
func isEmpty<X>(buffer : Buffer<X>) : Bool
```

| **Parameters**     |                      |
| ------------------ | -------------------- |
| Generic parameters | `X`                  |
| Variable argument  | `buffer : Buffer<X>` |
| Return type        | `Bool`               |

```motoko, run
{{#include _mo/buffer/isEmpty.mo:a}}
```

## Buffer.contains

```motoko
func contains<X>(

  buffer : Buffer<X>
 element : X
   equal : (X, X) -> Bool

) : Bool
```

| **Parameters**     |                          |
| ------------------ | ------------------------ |
| Generic parameters | `X`                      |
| Variable argument1 | `buffer : Buffer<X>`     |
| Variable argument2 | `element : X`            |
| Function argument  | `equal : (X, X) -> Bool` |
| Return type        | `Bool`                   |

```motoko, run
{{#include _mo/buffer/contains.mo:a}}
```

## Buffer.clone

```motoko
func clone<X>(buffer : Buffer<X>) : Buffer<X>
```

| **Parameters**     |                      |
| ------------------ | -------------------- |
| Generic parameters | `X`                  |
| Variable argument  | `buffer : Buffer<X>` |
| Return type        | `Buffer<X>`          |

```motoko, run
{{#include _mo/buffer/clone.mo:a}}
```

## Buffer.max

```motoko
func max<X>(

  buffer : Buffer<X>
 compare : (X, X) -> Order

 ) : ?X
```

| **Parameters**     |                             |
| ------------------ | --------------------------- |
| Generic parameters | `X`                         |
| Variable argument  | `buffer : Buffer<X>`        |
| Function argument  | `compare : (X, X) -> Order` |
| Return type        | `?X`                        |

```motoko, run
{{#include _mo/buffer/max.mo:a}}
```

## Buffer.min

```motoko
func min<X>(

  buffer : Buffer<X>
 compare : (X, X) -> Order

 ) : ?X
```

| **Parameters**     |                             |
| ------------------ | --------------------------- |
| Generic parameters | `X`                         |
| Variable argument  | `buffer : Buffer<X>`        |
| Function argument  | `compare : (X, X) -> Order` |
| Return type        | `?X`                        |

```motoko, run
{{#include _mo/buffer/min.mo:a}}
```

## Buffer.equal

```motoko
func equal<X>(

 buffer1 : Buffer<X>
 buffer2 : Buffer<X>
   equal : (X, X) -> Bool

   ) : Bool
```

| **Parameters**     |                          |
| ------------------ | ------------------------ |
| Generic parameters | `X`                      |
| Variable argument1 | `buffer1 : Buffer<X>`    |
| Variable argument2 | `buffer2 : Buffer<X>`    |
| Function argument  | `equal : (X, X) -> Bool` |
| Return type        | `Bool`                   |

```motoko, run
{{#include _mo/buffer/equal.mo:a}}
```

## Buffer.compare

```motoko
func compare<X>(

 buffer1 : Buffer<X>
 buffer2 : Buffer<X>
 compare : (X, X) -> Order.Order

 ) : Order.Order
```

| **Parameters**     |                                    |
| ------------------ | ---------------------------------- |
| Generic parameters | `X`                                |
| Variable argument1 | `buffer1 : Buffer<X>`              |
| Variable argument2 | `buffer2 : Buffer<X>`              |
| Function argument  | `compare : (X, X) -> Order.Order)` |
| Return type        | `Order.Order`                      |

```motoko, run
{{#include _mo/buffer/compare.mo:a}}
```

## Buffer.toText

```motoko
func toText<X>(

 buffer : Buffer<X>
 toText : X -> Text

 ) : Text
```

| **Parameters**     |                      |
| ------------------ | -------------------- |
| Generic parameters | `X`                  |
| Variable argument  | `buffer : Buffer<X>` |
| Function argument  | `toText : X -> Text` |
| Return type        | `Text`               |

```motoko, run
{{#include _mo/buffer/toText.mo:a}}
```

## Buffer.hash

```motoko
func toText<X>(

 buffer : Buffer<X>
   hash : X -> Nat32)

 ) : Nat32
```

| **Parameters**     |                      |
| ------------------ | -------------------- |
| Generic parameters | `X`                  |
| Variable argument  | `buffer : Buffer<X>` |
| Function argument  | `hash : X -> Nat32)` |
| Return type        | `Nat32`              |

```motoko, run
{{#include _mo/buffer/hash.mo:a}}
```

## Buffer.indexOf

```motoko
func indexOf<X>(

element : X
 buffer : Buffer<X>
  equal : (X, X) -> Bool

  ) : ?Nat
```

| **Parameters**     |                          |
| ------------------ | ------------------------ |
| Generic parameters | `X`                      |
| Variable argument1 | `element : X`            |
| Variable argument2 | `buffer  : Buffer<X>`    |
| Function argument  | `equal : (X, X) -> Bool` |
| Return type        | `?Nat`                   |

```motoko, run
{{#include _mo/buffer/indexOf.mo:a}}
```

## Buffer.lastIndexOf

```motoko
func indexOf<X>(

element : X
 buffer : Buffer<X>
  equal : (X, X) -> Bool

  ) : ?Nat
```

| **Parameters**     |                          |
| ------------------ | ------------------------ |
| Generic parameters | `X`                      |
| Variable argument1 | `element : X`            |
| Variable argument2 | `buffer  : Buffer<X>`    |
| Function argument  | `equal : (X, X) -> Bool` |
| Return type        | `?Nat`                   |

```motoko, run
{{#include _mo/buffer/lastIndexOf.mo:a}}
```

## Buffer.indexOfBuffer

```motoko
func indexOfBuffer<X>(

 subBuffer : Buffer<X>
    buffer : Buffer<X>
     equal : (X, X) -> Bool

    ) : ?Nat
```

| **Parameters**     |                          |
| ------------------ | ------------------------ |
| Generic parameters | `X`                      |
| Variable argument1 | `subBuffer : Buffer<X>`  |
| Variable argument2 | `buffer  : Buffer<X>`    |
| Function argument  | `equal : (X, X) -> Bool` |
| Return type        | `?Nat`                   |

```motoko, run
{{#include _mo/buffer/indexOfBuffer.mo:a}}
```

## Buffer.binarySearch

```motoko
func binarySearch<X>(

element : X
 buffer : Buffer<X>
compare : (X, X) -> Order.Order

  ) : ?Nat
```

| **Parameters**     |                                   |
| ------------------ | --------------------------------- |
| Generic parameters | `X`                               |
| Variable argument1 | `element : X`                     |
| Variable argument2 | `buffer  : Buffer<X>`             |
| Function argument  | `compare : (X, X) -> Order.Order` |
| Return type        | `?Nat`                            |

```motoko, run
{{#include _mo/buffer/binarySearch.mo:a}}
```

## Buffer.subBuffer

```motoko
func subBuffer<X>(

    buffer : Buffer<X>
     start : Nat
    length : Nat

    ) : Buffer<X>
```

| **Parameters**     |                       |
| ------------------ | --------------------- |
| Generic parameters | `X`                   |
| Variable argument1 | `buffer  : Buffer<X>` |
| Variable argument2 | `start : Nat`         |
| variable argument3 | `lenght : Nat`        |
| Return type        | `Buffer<X>`           |

```motoko, run
{{#include _mo/buffer/subBuffer.mo:a}}
```

## Buffer.isSubBufferOf

```motoko
func isSubBufferOf<X>(

 subBuffer : Buffer<X>
    buffer : Buffer<X>
     equal : (X, X) -> Bool

    ) : Bool
```

| **Parameters**     |                          |
| ------------------ | ------------------------ |
| Generic parameters | `X`                      |
| Variable argument1 | `subBuffer : Buffer<X>`  |
| Variable argument2 | `buffer  : Buffer<X>`    |
| Function argument  | `equal : (X, X) -> Bool` |
| Return type        | `Bool`                   |

```motoko, run
{{#include _mo/buffer/isSubBufferOf.mo:a}}
```

## Buffer.isStrictSubBufferOf

```motoko
func isSubBufferOf<X>(

 subBuffer : Buffer<X>
    buffer : Buffer<X>
     equal : (X, X) -> Bool

    ) : Bool
```

| **Parameters**     |                          |
| ------------------ | ------------------------ |
| Generic parameters | `X`                      |
| Variable argument1 | `subBuffer : Buffer<X>`  |
| Variable argument2 | `buffer  : Buffer<X>`    |
| Function argument  | `equal : (X, X) -> Bool` |
| Return type        | `Bool`                   |

```motoko, run
{{#include _mo/buffer/isStrictSubBufferOf.mo:a}}
```

## Buffer.prefix

```motoko
func prefix<X>(

    buffer : Buffer<X>
    length : Nat

    ) : Buffer<X>
```

| **Parameters**     |                       |
| ------------------ | --------------------- |
| Generic parameters | `X`                   |
| Variable argument1 | `buffer  : Buffer<X>` |
| variable argument2 | `lenght : Nat`        |
| Return type        | `Buffer<X>`           |

```motoko, run
{{#include _mo/buffer/prefix.mo:a}}
```

## Buffer.isPrefixOf

```motoko
func isPrefixOf<X>(

    prefix : Buffer<X>
    buffer : Buffer<X>
     equal : (X, X) -> Bool

    ) : Bool
```

| **Parameters**     |                          |
| ------------------ | ------------------------ |
| Generic parameters | `X`                      |
| Variable argument1 | `prefix : Buffer<X>`     |
| Variable argument2 | `buffer  : Buffer<X>`    |
| Function argument  | `equal : (X, X) -> Bool` |
| Return type        | `Bool`                   |

```motoko, run
{{#include _mo/buffer/isPrefixOf.mo:a}}
```

## Buffer.isStrictPrefixOf

```motoko
func isStrictPrefixOf<X>(

    prefix : Buffer<X>
    buffer : Buffer<X>
     equal : (X, X) -> Bool

    ) : Bool
```

| **Parameters**     |                          |
| ------------------ | ------------------------ |
| Generic parameters | `X`                      |
| Variable argument1 | `prefix : Buffer<X>`     |
| Variable argument2 | `buffer  : Buffer<X>`    |
| Function argument  | `equal : (X, X) -> Bool` |
| Return type        | `Bool`                   |

```motoko, run
{{#include _mo/buffer/isStrictPrefixOf.mo:a}}
```

## Buffer.suffix

```motoko
func suffix<X>(

    buffer : Buffer<X>
    length : Nat

    ) : Buffer<X>
```

| **Parameters**     |                      |
| ------------------ | -------------------- |
| Generic parameters | `X`                  |
| Variable argument1 | `buffer : Buffer<X>` |
| variable argument2 | `lenght : Nat`       |
| Return type        | `Buffer<X>`          |

```motoko, run
{{#include _mo/buffer/suffix.mo:a}}
```

## Buffer.isSuffixOf

```motoko
func isSuffixOf<X>(

    suffix : Buffer<X>
    buffer : Buffer<X>
     equal : (X, X) -> Bool

    ) : Bool
```

| **Parameters**     |                          |
| ------------------ | ------------------------ |
| Generic parameters | `X`                      |
| Variable argument1 | `suffix : Buffer<X>`     |
| Variable argument2 | `buffer  : Buffer<X>`    |
| Function argument  | `equal : (X, X) -> Bool` |
| Return type        | `Bool`                   |

```motoko, run
{{#include _mo/buffer/isSuffixOf.mo:a}}
```

## Buffer.isStrictSuffixOf

```motoko
func isSuffixOf<X>(

    suffix : Buffer<X>
    buffer : Buffer<X>
     equal : (X, X) -> Bool

    ) : Bool
```

| **Parameters**     |                          |
| ------------------ | ------------------------ |
| Generic parameters | `X`                      |
| Variable argument1 | `suffix : Buffer<X>`     |
| Variable argument2 | `buffer  : Buffer<X>`    |
| Function argument  | `equal : (X, X) -> Bool` |
| Return type        | `Bool`                   |

```motoko, run
{{#include _mo/buffer/isStrictSuffixOf.mo:a}}
```

## Buffer.forAll

```motoko
func forAll<X>(

    buffer : Buffer<X>
 predicate : X -> Bool

    ) : Bool
```

| **Parameters**     |                         |
| ------------------ | ----------------------- |
| Generic parameters | `X`                     |
| Variable argument  | `buffer : Buffer<X>`    |
| Function argument  | `predicate : X -> Bool` |
| Return type        | `Bool`                  |

```motoko, run
{{#include _mo/buffer/forAll.mo:a}}
```

## Buffer.forSome

```motoko
func forSome<X>(

    buffer : Buffer<X>
 predicate : X -> Bool

    ) : Bool
```

| **Parameters**     |                         |
| ------------------ | ----------------------- |
| Generic parameters | `X`                     |
| Variable argument  | `buffer : Buffer<X>`    |
| Function argument  | `predicate : X -> Bool` |
| Return type        | `Bool`                  |

```motoko, run
{{#include _mo/buffer/forSome.mo:a}}
```

## Buffer.forNone

```motoko
func forNone<X>(

    buffer : Buffer<X>
 predicate : X -> Bool

    ) : Bool
```

| **Parameters**     |                         |
| ------------------ | ----------------------- |
| Generic parameters | `X`                     |
| Variable argument  | `buffer : Buffer<X>`    |
| Function argument  | `predicate : X -> Bool` |
| Return type        | `Bool`                  |

```motoko, run
{{#include _mo/buffer/forNone.mo:a}}
```

## Buffer.toArray

```motoko
func toArray<X>(buffer : Buffer<X>) : [X]
```

| **Parameters**     |                      |
| ------------------ | -------------------- |
| Generic parameters | `X`                  |
| Variable argument  | `buffer : Buffer<X>` |
| Return type        | `[X]`                |

```motoko, run
{{#include _mo/buffer/toArray.mo:a}}
```

## Buffer.toVarArray

```motoko
func toVarArray<X>(buffer : Buffer<X>) : [var X]
```

| **Parameters**     |                      |
| ------------------ | -------------------- |
| Generic parameters | `X`                  |
| Variable argument  | `buffer : Buffer<X>` |
| Return type        | `[var X]`            |

```motoko, run
{{#include _mo/buffer/toVarArray.mo:a}}
```

## Buffer.fromArray

```motoko
func fromArray<X>(array : [X]) : Buffer<X>
```

| **Parameters**     |               |
| ------------------ | ------------- |
| Generic parameters | `X`           |
| Variable argument  | `array : [X]` |
| Return type        | `Buffer<X>`   |

```motoko, run
{{#include _mo/buffer/fromArray.mo:a}}
```

## Buffer.fromVarArray

```motoko
func fromArray<X>(array : [var X]) : Buffer<X>
```

| **Parameters**     |                   |
| ------------------ | ----------------- |
| Generic parameters | `X`               |
| Variable argument  | `array : [var X]` |
| Return type        | `Buffer<X>`       |

```motoko, run
{{#include _mo/buffer/fromArray.mo:a}}
```

## Buffer.fromIter

```motoko
func fromIter<X>(iter : { next : () -> ?X }) : Buffer<X>
```

| **Parameters**     |                              |
| ------------------ | ---------------------------- |
| Generic parameters | `X`                          |
| Variable argument  | `iter : { next : () -> ?X }` |
| Return type        | `Buffer<X>`                  |

```motoko, run
{{#include _mo/buffer/fromIter.mo:a}}
```

## Buffer.trimToSize

```motoko
func trimToSize<X>(buffer : Buffer<X>) : ()
```

| **Parameters**     |                      |
| ------------------ | -------------------- |
| Generic parameters | `X`                  |
| Variable argument  | `buffer : Buffer<X>` |
| Return type        | `()`                 |

```motoko, run
{{#include _mo/buffer/trimToSize.mo:a}}
```

## Buffer.map

```motoko
func map<X, Y>(

buffer : Buffer<X>
     f : X -> Y

  ) : Buffer<Y>
```

| **Parameters**     |                      |
| ------------------ | -------------------- |
| Generic parameters | `X, Y`               |
| Variable argument  | `buffer : Buffer<X>` |
| Function argument  | `f : X -> Y`         |
| Return type        | `Buffer<Y>`          |

```motoko, run
{{#include _mo/buffer/map.mo:a}}
```

## Buffer.iterate

```motoko
func iterate<X>(

buffer : Buffer<X>
     f : X -> ()

  ) : ()
```

| **Parameters**     |                      |
| ------------------ | -------------------- |
| Generic parameters | `X`                  |
| Variable argument  | `buffer : Buffer<X>` |
| Function argument  | `f : X -> ()`        |
| Return type        | `()`                 |

```motoko, run
{{#include _mo/buffer/iterate.mo:a}}
```

## Buffer.mapEntries

```motoko
func mapEntries<X, Y>(

buffer : Buffer<X>
     f : (Nat, X) -> Y

 ) : Buffer<Y>
```

| **Parameters**     |                      |
| ------------------ | -------------------- |
| Generic parameters | `X, Y`               |
| Variable argument  | `buffer : Buffer<X>` |
| Function argument  | `f : (Nat, X) -> Y`  |
| Return type        | `Buffer<Y>`          |

```motoko, run
{{#include _mo/buffer/mapEntries.mo:a}}
```

## Buffer.mapFilter

```motoko
func mapFilter<X, Y>(

buffer : Buffer<X>
     f :  X -> ?Y

 ) : Buffer<Y>
```

| **Parameters**     |                      |
| ------------------ | -------------------- |
| Generic parameters | `X, Y`               |
| Variable argument  | `buffer : Buffer<X>` |
| Function argument  | `f : X -> ?Y`        |
| Return type        | `Buffer<Y>`          |

```motoko, run
{{#include _mo/buffer/mapFilter.mo:a}}
```

## Buffer.mapResult

```motoko
func mapResult<X, Y, E>(

buffer : Buffer<X>
     f : X -> Result.Result<Y, E>

     ) : Result.Result<Buffer<Y>, E>
```

| **Parameters**     |                                |
| ------------------ | ------------------------------ |
| Generic parameters | `X, Y, E`                      |
| Variable argument  | `buffer : Buffer<X>`           |
| Function argument  | `f : X -> Result.Result<Y, E>` |
| Return type        | `Result.Result<Buffer<Y>, E>`  |

```motoko, run
{{#include _mo/buffer/mapResult.mo:a}}
```

## Buffer.chain

```motoko
func chain<X, Y>(

buffer : Buffer<X>
     k : X -> Buffer<Y>

     ) : Buffer<Y>
```

| **Parameters**     |                      |
| ------------------ | -------------------- |
| Generic parameters | `X, Y`               |
| Variable argument  | `buffer : Buffer<X>` |
| Function argument  | `k : X -> Buffer<Y>` |
| Return type        | `Buffer<Y>`          |

```motoko, run
{{#include _mo/buffer/chain.mo:a}}
```

## Buffer.foldLeft

```motoko
func foldLeft<A, X>(

   buffer : Buffer<X>
     base : A
  combine : (A, X) -> A

      ) : A
```

| **Parameters**     |                         |
| ------------------ | ----------------------- |
| Generic parameters | `A, X`                  |
| Variable argument1 | `buffer : Buffer<X>`    |
| Variable argument2 | `base : A`              |
| Function argument  | `combine : (A, X) -> A` |
| Return type        | `A`                     |

```motoko, run
{{#include _mo/buffer/foldLeft.mo:a}}
```

## Buffer.foldRight

```motoko
func foldLeft<A, X>(

   buffer : Buffer<X>
     base : A
  combine : (X, A) -> A

      ) : A
```

| **Parameters**     |                         |
| ------------------ | ----------------------- |
| Generic parameters | `A, X`                  |
| Variable argument1 | `buffer : Buffer<X>`    |
| Variable argument2 | `base : A`              |
| Function argument  | `combine : (X, A) -> A` |
| Return type        | `A`                     |

```motoko, run
{{#include _mo/buffer/foldRight.mo:a}}
```

## Buffer.first

```motoko
func first<X>(buffer : Buffer<X>) : X
```

| **Parameters**     |                      |
| ------------------ | -------------------- |
| Generic parameters | `X`                  |
| Variable argument  | `buffer : Buffer<X>` |
| Return type        | `X`                  |

```motoko, run
{{#include _mo/buffer/first.mo:a}}
```

## Buffer.last

```motoko
func last<X>(buffer : Buffer<X>) : X
```

| **Parameters**     |                      |
| ------------------ | -------------------- |
| Generic parameters | `X`                  |
| Variable argument  | `buffer : Buffer<X>` |
| Return type        | `X`                  |

```motoko, run
{{#include _mo/buffer/last.mo:a}}
```

## Buffer.make

```motoko
func make<X>(element : X) : Buffer<X>
```

| **Parameters**     |               |
| ------------------ | ------------- |
| Generic parameters | `X`           |
| Variable argument  | `element : X` |
| Return type        | `Buffer<X>`   |

```motoko, run
{{#include _mo/buffer/make.mo:a}}
```

## Buffer.reverse

```motoko
func reverse<X>(buffer : Buffer<X>) : ()
```

| **Parameters**     |                      |
| ------------------ | -------------------- |
| Generic parameters | `X`                  |
| Variable argument  | `buffer : Buffer<X>` |
| Return type        | `()`                 |

```motoko, run
{{#include _mo/buffer/reverse.mo:a}}
```

## Buffer.merge

```motoko
func merge<X>(

  buffer1 : Buffer<X>
  buffer2 : Buffer<X>
  compare : (X, X) -> Order

  ) : Buffer<X>
```

| **Parameters**     |                             |
| ------------------ | --------------------------- |
| Generic parameters | `X`                         |
| Variable argument1 | `buffer1 : Buffer<X>`       |
| Variable argument2 | `buffer2 : Buffer<X>`       |
| Function argument  | `combine : (X, X) -> Order` |
| Return type        | `BufferX`                   |

```motoko, run
{{#include _mo/buffer/merge.mo:a}}
```

## Buffer.removeDuplicates

```motoko
func removeDuplicates<X>(

     buffer : Buffer<X>
    compare : (X, X) -> Order

    ) : ()
```

| **Parameters**     |                             |
| ------------------ | --------------------------- |
| Generic parameters | `X`                         |
| Variable argument  | `buffer : Buffer<X>`        |
| Function argument  | `compare : (X, X) -> Order` |
| Return type        | `()`                        |

```motoko, run
{{#include _mo/buffer/removeDuplicates.mo:a}}
```

## Buffer.partition

```motoko
func partition<X>(

    buffer : Buffer<X>
 predicate : X -> Bool

 ) : (Buffer<X>, Buffer<X>)
```

| **Parameters**     |                          |
| ------------------ | ------------------------ |
| Generic parameters | `X`                      |
| Variable argument  | `buffer : Buffer<X>`     |
| Function argument  | `predicate : X -> Bool`  |
| Return type        | `(Buffer<X>, Buffer<X>)` |

```motoko, run
{{#include _mo/buffer/partition.mo:a}}
```

## Buffer.split

```motoko
func split<X>(

 buffer : Buffer<X>
  index : Nat

 ) : (Buffer<X>, Buffer<X>)
```

| **Parameters**     |                          |
| ------------------ | ------------------------ |
| Generic parameters | `X`                      |
| Variable argument1 | `buffer : Buffer<X>`     |
| Variable argument2 | `index : Nat`            |
| Return type        | `(Buffer<X>, Buffer<X>)` |

```motoko, run
{{#include _mo/buffer/split.mo:a}}
```

## Buffer.chunk

```motoko
func chunk<X>(

   buffer : Buffer<X>
     size : Nat

 ) : Buffer<Buffer<X>>
```

| **Parameters**     |                       |
| ------------------ | --------------------- |
| Generic parameters | `X`                   |
| Variable argument1 | `buffer : Buffer<X>`  |
| Variable argument2 | `size : Nat`          |
| Return type        | `(Buffer<Buffer<X>>)` |

```motoko, run
{{#include _mo/buffer/chunk.mo:a}}
```

## Buffer.groupBy

```motoko
func groupBy<X>(

   buffer : Buffer<X>
    equal : (X, X) -> Bool

 ) : Buffer<Buffer<X>>
```

| **Parameters**     |                          |
| ------------------ | ------------------------ |
| Generic parameters | `X`                      |
| Variable argument  | `buffer : Buffer<X>`     |
| Function argument  | `equal : (X, X) -> Bool` |
| Return type        | `(Buffer<Buffer<X>>)`    |

```motoko, run
{{#include _mo/buffer/groupBy.mo:a}}
```

## Buffer.flatten

```motoko
func flatten<X>(buffer : Buffer<Buffer<X>>) : Buffer<X>
```

| **Parameters**     |                              |
| ------------------ | ---------------------------- |
| Generic parameters | `X`                          |
| Variable argument  | `buffer : Buffer<Buffer<X>>` |
| Return type        | `Buffer<X>`                  |

```motoko, run
{{#include _mo/buffer/flatten.mo:a}}
```

## Buffer.zip

```motoko
func zip<X, Y>(

  buffer1 : Buffer<X>
  buffer2 : Buffer<X>

  ) : Buffer<(X, Y)>
```

| **Parameters**     |                       |
| ------------------ | --------------------- |
| Generic parameters | `X, Y`                |
| Variable argument1 | `buffer1 : Buffer<X>` |
| Variable argument2 | `buffer2 : Buffer<X>` |
| Return type        | `Buffer<(X, Y)>`      |

```motoko, run
{{#include _mo/buffer/zip.mo:a}}
```

## Buffer.zipWith

```motoko
func zipWith<X, Y, Z>(

buffer1 : Buffer<X>
buffer2 : Buffer<Y>

    zip : (X, Y) -> Z

      ) : Buffer<Z>
```

| **Parameters**     |                       |
| ------------------ | --------------------- |
| Generic parameters | `X, Y, Z`             |
| Variable argument1 | `buffer1 : Buffer<X>` |
| Variable argument2 | `buffer2 : Buffer<Y>` |
| Function argument  | `zip : (X, Y) -> Z`   |
| Return type        | `Buffer<Z>`           |

```motoko, run
{{#include _mo/buffer/zip.mo:a}}
```

## Buffer.takeWhile

```motoko
func takeWhile<X>(

    buffer : Buffer<X>
 predicate : X -> Bool

 ) : (Buffer<X>)
```

| **Parameters**     |                         |
| ------------------ | ----------------------- |
| Generic parameters | `X`                     |
| Variable argument  | `buffer : Buffer<X>`    |
| Function argument  | `predicate : X -> Bool` |
| Return type        | `(Buffer<X>)`           |

```motoko, run
{{#include _mo/buffer/takeWhile.mo:a}}
```

## Buffer.dropWhile

```motoko
func dropWhile<X>(

    buffer : Buffer<X>
 predicate : X -> Bool

 ) : (Buffer<X>)
```

| **Parameters**     |                         |
| ------------------ | ----------------------- |
| Generic parameters | `X`                     |
| Variable argument  | `buffer : Buffer<X>`    |
| Function argument  | `predicate : X -> Bool` |
| Return type        | `(Buffer<X>)`           |

```motoko, run
{{#include _mo/buffer/dropWhile.mo:a}}
```
