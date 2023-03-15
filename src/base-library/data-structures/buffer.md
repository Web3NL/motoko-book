# Buffer

The *convention* is to name the [*module alias*](/common-programming-concepts/modules.html#imports) after the [*file name*](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/buffer.mo:a}}
```
  
[Class `Buffer<X>`](#class)   
&nbsp;&nbsp;&nbsp;&nbsp;[Method `size`](#buffersize)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `add`](#bufferadd)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `get`](#bufferget)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `getOpt`](#buffergetOpt)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `put`](#bufferput)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `removeLast`](#bufferremovelast)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `remove`](#bufferremove)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `clear`](#bufferclear)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `filterEntries`](#bufferfilterentries)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `capacity`](#buffercapacity)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `reserve`](#bufferreserve)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `append`](#bufferappend)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `insert`](#bufferinsert)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `insertBuffer`](#bufferinsertbuffer)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `sort`](#buffersort)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `vals`](#buffervals)  
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


## Buffer.size

```motoko
func size() : Nat
```
The function `size` takes no argument and returns a `Nat` value.  

```motoko
{{#include _mo/buffer/method/size.mo:a}}
```
## Buffer.add

```motoko
func add(element : X) : ()
```
The function `add` takes one generic type `X` argument and returns a `()` value.  

```motoko
{{#include _mo/buffer/method/add.mo:a}}
```
## Buffer.get

```motoko
func get(index : Nat) : X
```
The function `get` takes one `Nat` argument and returns a generic type value `X` .  

```motoko
{{#include _mo/buffer/method/get.mo:a}}
```

## Buffer.getOpt

```motoko
func getOpt(index : Nat) : ?X
```
The function `getOpt` takes one `Nat` argument and returns a generic type value `?X`.  

```motoko
{{#include _mo/buffer/method/getOpt.mo:a}}
```
## Buffer.put

```motoko
func put(index : Nat, element : X) : ()
```
The function `put` takes one `Nat`and one generic type `x` argument and returns a `()` value.  

```motoko
{{#include _mo/buffer/method/put.mo:a}}
```

## Buffer.removeLast

```motoko
func removeLast() : ?X
```
The function `removeLast` takes no argument and returns a generic type value `?X`.  

```motoko
{{#include _mo/buffer/method/removeLast.mo:a}}
```

## Buffer.remove

```motoko
func remove(index : Nat) : X
```
The function `remove` takes one `Nat` argument and returns a generic type value `X`.  

```motoko
{{#include _mo/buffer/method/remove.mo:a}}
```
## Buffer.clear

```motoko
func clear() : ()
```
The function `clear` takes no argument and returns a `()` value.  

```motoko
{{#include _mo/buffer/method/clear.mo:a}}
```
## Buffer.filterEntries

```motoko
func filterEntries(predicate : (Nat, X) -> Bool) : ()
```
### Parameters

|                     |                        |
| ------------------- | ---------------------- |
| Function argument   | `(Nat, X) -> Bool`     |
| Return type         | `()`                   |

```motoko
{{#include _mo/buffer/method/filterEntries.mo:a}}
```
## Buffer.capacity

```motoko
func capacity() : Nat
```
The function `capacity` takes no argument and returns a `Nat` value.  

```motoko
{{#include _mo/buffer/method/capacity.mo:a}}
```
## Buffer.reserve

```motoko
func reserve(capacity : Nat) : ()
```
The function `reserve` takes one `Nat` argument and returns a `()` value.  

```motoko
{{#include _mo/buffer/method/reserve.mo:a}}
```
## Buffer.append

```motoko
func append(buffer2 : Buffer<X>) : ()
```
The function `append` takes one generic type `Buffer<X>` argument and returns a `()` value.  

```motoko
{{#include _mo/buffer/method/append.mo:a}}
```
## Buffer.insert

```motoko
func insert(index : Nat, element : X) : ()
```
The function `insert` takes one `Nat`and one generic type `X` argument and returns a `()` value.  

```motoko
{{#include _mo/buffer/method/insert.mo:a}}
```

## Buffer.insertBuffer

```motoko
func insertBuffer(index : Nat, buffer2 : Buffer<X>) : ()
```
The function `insertBuffer` takes one `Nat`and one generic type `Buffer<X>` argument and returns a `()` value.  

```motoko
{{#include _mo/buffer/method/insertBuffer.mo:a}}
```

## Buffer.sort

```motoko
func sort(compare : (X, X) -> Order.Order) : ()
```
### Parameters

|                     |                          |
| ------------------- | ----------------------   |
| Function argument   | `(X, X) -> Order.Order`  |
| Return type         | `()`                     |

```motoko
{{#include _mo/buffer/method/sort.mo:a}}
```

## Buffer.vals

```motoko
func vals() : { next : () -> ?X }
```
The function `vals` takes no argument and returns a `Iter` value.  

```motoko
{{#include _mo/buffer/method/vals.mo:a}}
```

## Buffer.isEmpty

### Function signature

```motoko
func isEmpty<X>(buffer : Buffer<X>) : Bool
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `buffer : Buffer<X>`                |
| Return type         | `Bool`                              |


```motoko
{{#include _mo/buffer/isEmpty.mo:a}}
```

## Buffer.contains

### Function signature

```motoko
func contains<X>(

  buffer : Buffer<X>
   
 element : X 
 
   equal : (X, X) -> Bool
  
) : Bool 
```

### Parameters

|                     |                               |
| ------------------- | ----------------------        |
| Generic parameters  | `X`                           |
| Variable argument1  | `buffer : Buffer<X>`          |
| Variable argument2  | `element : X`                 |
| Function argument   | `equal : (X, X) -> Bool`      |
| Return type         | `Bool`                        |


```motoko
{{#include _mo/buffer/contains.mo:a}}
```

## Buffer.clone

### Function signature

```motoko
func clone<X>(buffer : Buffer<X>) : Buffer<X>
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `buffer : Buffer<X>`                |
| Return type         | `Buffer<X>`                         |


```motoko
{{#include _mo/buffer/clone.mo:a}}
```

## Buffer.max

### Function signature

```motoko
func max<X>(
    
  buffer : Buffer<X>

 compare : (X, X) -> Order
 
 ) : ?X
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `buffer : Buffer<X>`                |
| Function argument   | `compare : (X, X) -> Order`         |
| Return type         | `?X`                                |


```motoko
{{#include _mo/buffer/max.mo:a}}
```

## Buffer.min

### Function signature

```motoko
func min<X>(
    
  buffer : Buffer<X>

 compare : (X, X) -> Order
 
 ) : ?X
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `buffer : Buffer<X>`                |
| Function argument   | `compare : (X, X) -> Order`         |
| Return type         | `?X`                                |


```motoko
{{#include _mo/buffer/min.mo:a}}
```

## Buffer.equal

### Function signature

```motoko
func equal<X>(
    
 buffer1 : Buffer<X>

 buffer2 : Buffer<X>
 
   equal : (X, X) -> Bool
   
   ) : Bool
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument1  | `buffer1 : Buffer<X>`               |
| Variable argument2  | `buffer2 : Buffer<X>`               |
| Function argument   | `equal : (X, X) -> Bool`            |
| Return type         | `Bool`                              |


```motoko
{{#include _mo/buffer/equal.mo:a}}
```

## Buffer.compare

### Function signature

```motoko
func compare<X>(
    
 buffer1 : Buffer<X>

 buffer2 : Buffer<X>
 
 compare : (X, X) -> Order.Order
 
 ) : Order.Order
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument1  | `buffer1 : Buffer<X>`               |
| Variable argument2  | `buffer2 : Buffer<X>`               |
| Function argument   | `compare : (X, X) -> Order.Order)`  |
| Return type         | `Order.Order`                       |


```motoko
{{#include _mo/buffer/compare.mo:a}}
```

## Buffer.toText

### Function signature

```motoko
func toText<X>(
    
 buffer : Buffer<X>

 toText : X -> Text
 
 ) : Text
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `buffer : Buffer<X>`                |
| Function argument   | `toText : X -> Text`                |
| Return type         | `Text`                              |


```motoko
{{#include _mo/buffer/toText.mo:a}}
```

## Buffer.hash

### Function signature

```motoko
func toText<X>(
    
 buffer : Buffer<X>

   hash : X -> Nat32)
 
 ) : Nat32
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `buffer : Buffer<X>`                |
| Function argument   | `hash : X -> Nat32)`                |
| Return type         | `Nat32`                             |


```motoko
{{#include _mo/buffer/hash.mo:a}}
```
## Buffer.indexOf

### Function signature

```motoko
func indexOf<X>(
    
element : X

 buffer : Buffer<X>
 
  equal : (X, X) -> Bool
  
  ) : ?Nat
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument1  | `element : X`                       |
| Variable argument2  | `buffer  : Buffer<X>`               |
| Function argument   | `equal : (X, X) -> Bool`            |
| Return type         | `?Nat`                              |


```motoko
{{#include _mo/buffer/indexOf.mo:a}}
```

## Buffer.lastIndexOf

### Function signature

```motoko
func indexOf<X>(
    
element : X

 buffer : Buffer<X>
 
  equal : (X, X) -> Bool
  
  ) : ?Nat
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument1  | `element : X`                       |
| Variable argument2  | `buffer  : Buffer<X>`               |
| Function argument   | `equal : (X, X) -> Bool`            |
| Return type         | `?Nat`                              |


```motoko
{{#include _mo/buffer/lastIndexOf.mo:a}}
```

## Buffer.indexOfBuffer

### Function signature

```motoko
func indexOfBuffer<X>(
    
 subBuffer : Buffer<X>
    
    buffer : Buffer<X>
     
     equal : (X, X) -> Bool
  
    ) : ?Nat
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument1  | `subBuffer : Buffer<X>`             |
| Variable argument2  | `buffer  : Buffer<X>`               |
| Function argument   | `equal : (X, X) -> Bool`            |
| Return type         | `?Nat`                              |


```motoko
{{#include _mo/buffer/indexOfBuffer.mo:a}}
```

## Buffer.binarySearch

### Function signature

```motoko
func binarySearch<X>(
    
element : X

 buffer : Buffer<X>
 
compare : (X, X) -> Order.Order
  
  ) : ?Nat
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument1  | `element : X`                       |
| Variable argument2  | `buffer  : Buffer<X>`               |
| Function argument   | `compare : (X, X) -> Order.Order`   |
| Return type         | `?Nat`                              |


```motoko
{{#include _mo/buffer/binarySearch.mo:a}}
```

## Buffer.subBuffer

### Function signature

```motoko
func subBuffer<X>(
    
    buffer : Buffer<X>
    
     start : Nat
     
    length : Nat
    
    ) : Buffer<X>
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument1  | `buffer  : Buffer<X>`               |
| Variable argument2  | `start : Nat`                       |
| variable argument3  | `lenght : Nat`                      |
| Return type         | `Buffer<X>`                         |


```motoko
{{#include _mo/buffer/subBuffer.mo:a}}
```

## Buffer.isSubBufferOf

### Function signature

```motoko
func isSubBufferOf<X>(
    
 subBuffer : Buffer<X>
    
    buffer : Buffer<X>
     
     equal : (X, X) -> Bool
  
    ) : Bool
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument1  | `subBuffer : Buffer<X>`             |
| Variable argument2  | `buffer  : Buffer<X>`               |
| Function argument   | `equal : (X, X) -> Bool`            |
| Return type         | `Bool`                              |


```motoko
{{#include _mo/buffer/isSubBufferOf.mo:a}}
```

## Buffer.isStrictSubBufferOf

### Function signature

```motoko
func isSubBufferOf<X>(
    
 subBuffer : Buffer<X>
    
    buffer : Buffer<X>
     
     equal : (X, X) -> Bool
  
    ) : Bool
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument1  | `subBuffer : Buffer<X>`             |
| Variable argument2  | `buffer  : Buffer<X>`               |
| Function argument   | `equal : (X, X) -> Bool`            |
| Return type         | `Bool`                              |


```motoko
{{#include _mo/buffer/isStrictSubBufferOf.mo:a}}
```

## Buffer.prefix

### Function signature

```motoko
func prefix<X>(
    
    buffer : Buffer<X>
     
    length : Nat
    
    ) : Buffer<X>
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument1  | `buffer  : Buffer<X>`               |
| variable argument2  | `lenght : Nat`                      |
| Return type         | `Buffer<X>`                         |


```motoko
{{#include _mo/buffer/prefix.mo:a}}
```

## Buffer.isPrefixOf

### Function signature

```motoko
func isPrefixOf<X>(
    
    prefix : Buffer<X>
    
    buffer : Buffer<X>
     
     equal : (X, X) -> Bool
  
    ) : Bool
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument1  | `prefix : Buffer<X>`                |
| Variable argument2  | `buffer  : Buffer<X>`               |
| Function argument   | `equal : (X, X) -> Bool`            |
| Return type         | `Bool`                              |


```motoko
{{#include _mo/buffer/isPrefixOf.mo:a}}
```

## Buffer.isStrictPrefixOf

### Function signature

```motoko
func isStrictPrefixOf<X>(
    
    prefix : Buffer<X>
    
    buffer : Buffer<X>
     
     equal : (X, X) -> Bool
  
    ) : Bool
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument1  | `prefix : Buffer<X>`                |
| Variable argument2  | `buffer  : Buffer<X>`               |
| Function argument   | `equal : (X, X) -> Bool`            |
| Return type         | `Bool`                              |


```motoko
{{#include _mo/buffer/isStrictPrefixOf.mo:a}}
```

## Buffer.suffix

### Function signature

```motoko
func suffix<X>(
    
    buffer : Buffer<X>
     
    length : Nat
    
    ) : Buffer<X>
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument1  | `buffer : Buffer<X>`                |
| variable argument2  | `lenght : Nat`                      |
| Return type         | `Buffer<X>`                         |


```motoko
{{#include _mo/buffer/suffix.mo:a}}
```

## Buffer.isSuffixOf

### Function signature

```motoko
func isSuffixOf<X>(
    
    suffix : Buffer<X>
    
    buffer : Buffer<X>
     
     equal : (X, X) -> Bool
  
    ) : Bool
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument1  | `suffix : Buffer<X>`                |
| Variable argument2  | `buffer  : Buffer<X>`               |
| Function argument   | `equal : (X, X) -> Bool`            |
| Return type         | `Bool`                              |


```motoko
{{#include _mo/buffer/isSuffixOf.mo:a}}
```

## Buffer.isStrictSuffixOf

### Function signature

```motoko
func isSuffixOf<X>(
    
    suffix : Buffer<X>
    
    buffer : Buffer<X>
     
     equal : (X, X) -> Bool
  
    ) : Bool
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument1  | `suffix : Buffer<X>`                |
| Variable argument2  | `buffer  : Buffer<X>`               |
| Function argument   | `equal : (X, X) -> Bool`            |
| Return type         | `Bool`                              |


```motoko
{{#include _mo/buffer/isStrictSuffixOf.mo:a}}
```

## Buffer.forAll

### Function signature

```motoko
func forAll<X>(
    
    buffer : Buffer<X>
    
 predicate : X -> Bool
     
    ) : Bool
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `buffer : Buffer<X>`                |
| Function argument   | `predicate : X -> Bool`             |
| Return type         | `Bool`                              |


```motoko
{{#include _mo/buffer/forAll.mo:a}}
```
## Buffer.forSome

### Function signature

```motoko
func forSome<X>(
    
    buffer : Buffer<X>
    
 predicate : X -> Bool
     
    ) : Bool
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `buffer : Buffer<X>`                |
| Function argument   | `predicate : X -> Bool`             |
| Return type         | `Bool`                              |


```motoko
{{#include _mo/buffer/forSome.mo:a}}
```
## Buffer.forNone

### Function signature

```motoko
func forNone<X>(
    
    buffer : Buffer<X>
    
 predicate : X -> Bool
     
    ) : Bool
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `buffer : Buffer<X>`                |
| Function argument   | `predicate : X -> Bool`             |
| Return type         | `Bool`                              |


```motoko
{{#include _mo/buffer/forNone.mo:a}}
```
## Buffer.toArray

### Function signature

```motoko
func toArray<X>(buffer : Buffer<X>) : [X]
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `buffer : Buffer<X>`                |
| Return type         | `[X]`                               |


```motoko
{{#include _mo/buffer/toArray.mo:a}}
```
## Buffer.toVarArray

### Function signature

```motoko
func toVarArray<X>(buffer : Buffer<X>) : [var X]
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `buffer : Buffer<X>`                |
| Return type         | `[var X]`                           |


```motoko
{{#include _mo/buffer/toVarArray.mo:a}}
```
## Buffer.fromArray

### Function signature

```motoko
func fromArray<X>(array : [X]) : Buffer<X>
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `array : [X]`                       |
| Return type         | `Buffer<X>`                         |


```motoko
{{#include _mo/buffer/fromArray.mo:a}}
```
## Buffer.fromVarArray

### Function signature

```motoko
func fromArray<X>(array : [var X]) : Buffer<X>
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `array : [var X]`                   |
| Return type         | `Buffer<X>`                         |


```motoko
{{#include _mo/buffer/fromArray.mo:a}}
```
## Buffer.fromIter

### Function signature

```motoko
func fromIter<X>(iter : { next : () -> ?X }) : Buffer<X>
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `iter : { next : () -> ?X }`        |
| Return type         | `Buffer<X>`                         |


```motoko
{{#include _mo/buffer/fromIter.mo:a}}
```
## Buffer.trimToSize

### Function signature

```motoko
func trimToSize<X>(buffer : Buffer<X>) : ()
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `buffer : Buffer<X>`                |
| Return type         | `()`                                |


```motoko
{{#include _mo/buffer/trimToSize.mo:a}}
```
## Buffer.map

### Function signature

```motoko
func map<X, Y>(
    
buffer : Buffer<X>
 
     f : X -> Y
  
  ) : Buffer<Y>
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X, Y`                              |
| Variable argument   | `buffer : Buffer<X>`                |
| Function argument   | `f : X -> Y`                        |
| Return type         | `Buffer<Y>`                         |


```motoko
{{#include _mo/buffer/map.mo:a}}
```
## Buffer.iterate

### Function signature

```motoko
func iterate<X>(
    
buffer : Buffer<X>
 
     f : X -> ()
  
  ) : ()
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `buffer : Buffer<X>`                |
| Function argument   | `f : X -> ()`                       |
| Return type         | `()`                                |


```motoko
{{#include _mo/buffer/iterate.mo:a}}
```
## Buffer.mapEntries

### Function signature

```motoko
func mapEntries<X, Y>(
    
buffer : Buffer<X>

     f : (Nat, X) -> Y
 
 ) : Buffer<Y>
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X, Y`                              |
| Variable argument   | `buffer : Buffer<X>`                |
| Function argument   | `f : (Nat, X) -> Y`                 |
| Return type         | `Buffer<Y>`                         |


```motoko
{{#include _mo/buffer/mapEntries.mo:a}}
```
## Buffer.mapFilter

### Function signature

```motoko
func mapFilter<X, Y>(
    
buffer : Buffer<X>

     f :  X -> ?Y
 
 ) : Buffer<Y>
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X, Y`                              |
| Variable argument   | `buffer : Buffer<X>`                |
| Function argument   | `f : X -> ?Y`                       |
| Return type         | `Buffer<Y>`                         |


```motoko
{{#include _mo/buffer/mapFilter.mo:a}}
```
## Buffer.mapResult

### Function signature

```motoko
func mapResult<X, Y, E>(
    
buffer : Buffer<X>
    
     f : X -> Result.Result<Y, E>
     
     ) : Result.Result<Buffer<Y>, E>
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X, Y, E`                           |
| Variable argument   | `buffer : Buffer<X>`                |
| Function argument   | `f : X -> Result.Result<Y, E>`      |
| Return type         | `Result.Result<Buffer<Y>, E>`       |


```motoko
{{#include _mo/buffer/mapResult.mo:a}}
```
## Buffer.chain

### Function signature

```motoko
func chain<X, Y>(
    
buffer : Buffer<X>
    
     k : X -> Buffer<Y>
     
     ) : Buffer<Y>
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X, Y`                              |
| Variable argument   | `buffer : Buffer<X>`                |
| Function argument   | `k : X -> Buffer<Y>`                |
| Return type         | `Buffer<Y>`                         |


```motoko
{{#include _mo/buffer/chain.mo:a}}
```
## Buffer.foldLeft

### Function signature

```motoko
func foldLeft<A, X>(
    
   buffer : Buffer<X>
    
     base : A
     
  combine : (A, X) -> A
      
      ) : A
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `A, X`                              |
| Variable argument1  | `buffer : Buffer<X>`                |
| Variable argument2  | `base : A`                          |
| Function argument   | `combine : (A, X) -> A`             |
| Return type         | `A`                                 |


```motoko
{{#include _mo/buffer/foldLeft.mo:a}}
```
## Buffer.foldRight

### Function signature

```motoko
func foldLeft<A, X>(
    
   buffer : Buffer<X>
    
     base : A
     
  combine : (X, A) -> A
      
      ) : A
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `A, X`                              |
| Variable argument1  | `buffer : Buffer<X>`                |
| Variable argument2  | `base : A`                          |
| Function argument   | `combine : (X, A) -> A`             |
| Return type         | `A`                                 |


```motoko
{{#include _mo/buffer/foldRight.mo:a}}
```
## Buffer.first

### Function signature

```motoko
func first<X>(buffer : Buffer<X>) : X
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `buffer : Buffer<X>`                |
| Return type         | `X`                                 |


```motoko
{{#include _mo/buffer/first.mo:a}}
```
## Buffer.last

### Function signature

```motoko
func last<X>(buffer : Buffer<X>) : X
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `buffer : Buffer<X>`                |
| Return type         | `X`                                 |


```motoko
{{#include _mo/buffer/last.mo:a}}
```
## Buffer.make

### Function signature

```motoko
func make<X>(element : X) : Buffer<X>
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `element : X`                       |
| Return type         | `Buffer<X>`                         |


```motoko
{{#include _mo/buffer/make.mo:a}}
```
## Buffer.reverse

### Function signature

```motoko
func reverse<X>(buffer : Buffer<X>) : ()
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `buffer : Buffer<X>`                |
| Return type         | `()`                                |


```motoko
{{#include _mo/buffer/reverse.mo:a}}
```
## Buffer.merge

### Function signature

```motoko
func merge<X>(
    
  buffer1 : Buffer<X>
    
  buffer2 : Buffer<X>
 
  compare : (X, X) -> Order
  
  ) : Buffer<X>
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument1  | `buffer1 : Buffer<X>`               |
| Variable argument2  | `buffer2 : Buffer<X>`               |
| Function argument   | `combine : (X, X) -> Order`         |
| Return type         | `BufferX`                           |


```motoko
{{#include _mo/buffer/merge.mo:a}}
```
## Buffer.removeDuplicates

### Function signature

```motoko
func removeDuplicates<X>(
    
     buffer : Buffer<X>
    
    compare : (X, X) -> Order
    
    ) : ()
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `buffer : Buffer<X>`                |
| Function argument   | `compare : (X, X) -> Order`         |
| Return type         | `()`                                |


```motoko
{{#include _mo/buffer/removeDuplicates.mo:a}}
```
## Buffer.partition

### Function signature

```motoko
func partition<X>(
    
    buffer : Buffer<X>
    
 predicate : X -> Bool
 
 ) : (Buffer<X>, Buffer<X>)
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `buffer : Buffer<X>`                |
| Function argument   | `predicate : X -> Bool`             |
| Return type         | `(Buffer<X>, Buffer<X>)`            |


```motoko
{{#include _mo/buffer/partition.mo:a}}
```
## Buffer.split

### Function signature

```motoko
func split<X>(
    
 buffer : Buffer<X>
    
  index : Nat
 
 ) : (Buffer<X>, Buffer<X>)
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument1  | `buffer : Buffer<X>`                |
| Variable argument2  | `index : Nat`                       |
| Return type         | `(Buffer<X>, Buffer<X>)`            |


```motoko
{{#include _mo/buffer/split.mo:a}}
```
## Buffer.chunk

### Function signature

```motoko
func chunk<X>(
    
   buffer : Buffer<X>
    
     size : Nat
     
 ) : Buffer<Buffer<X>>
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument1  | `buffer : Buffer<X>`                |
| Variable argument2  | `size : Nat`                        |
| Return type         | `(Buffer<Buffer<X>>)`               |


```motoko
{{#include _mo/buffer/chunk.mo:a}}
```
## Buffer.groupBy

### Function signature

```motoko
func groupBy<X>(
    
   buffer : Buffer<X>
    
    equal : (X, X) -> Bool
     
 ) : Buffer<Buffer<X>>
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `buffer : Buffer<X>`                |
| Function argument   | `equal : (X, X) -> Bool`            |
| Return type         | `(Buffer<Buffer<X>>)`               |


```motoko
{{#include _mo/buffer/groupBy.mo:a}}
```
## Buffer.flatten

### Function signature

```motoko
func flatten<X>(buffer : Buffer<Buffer<X>>) : Buffer<X>
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `buffer : Buffer<Buffer<X>>`        |
| Return type         | `Buffer<X>`                         |


```motoko
{{#include _mo/buffer/flatten.mo:a}}
```
## Buffer.zip

### Function signature

```motoko
func zip<X, Y>(
    
  buffer1 : Buffer<X>
    
  buffer2 : Buffer<X>
 
  ) : Buffer<(X, Y)>
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X, Y`                              |
| Variable argument1  | `buffer1 : Buffer<X>`               |
| Variable argument2  | `buffer2 : Buffer<X>`               |
| Return type         | `Buffer<(X, Y)>`                    |


```motoko
{{#include _mo/buffer/zip.mo:a}}
```
## Buffer.zipWith

### Function signature

```motoko
func zipWith<X, Y, Z>(
    
buffer1 : Buffer<X>
    
buffer2 : Buffer<Y>
     
    zip : (X, Y) -> Z
      
      ) : Buffer<Z>
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X, Y, Z`                           |
| Variable argument1  | `buffer1 : Buffer<X>`               |
| Variable argument2  | `buffer2 : Buffer<Y>`               |
| Function argument   | `zip : (X, Y) -> Z`                 |
| Return type         | `Buffer<Z>`                         |


```motoko
{{#include _mo/buffer/zip.mo:a}}
```
## Buffer.takeWhile

### Function signature

```motoko
func takeWhile<X>(
    
    buffer : Buffer<X>
    
 predicate : X -> Bool
 
 ) : (Buffer<X>)
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `buffer : Buffer<X>`                |
| Function argument   | `predicate : X -> Bool`             |
| Return type         | `(Buffer<X>)`                       |


```motoko
{{#include _mo/buffer/takeWhile.mo:a}}
```
## Buffer.dropWhile

### Function signature

```motoko
func dropWhile<X>(
    
    buffer : Buffer<X>
    
 predicate : X -> Bool
 
 ) : (Buffer<X>)
```
### Parameters

|                     |                                     |
| ------------------- | ----------------------              |
| Generic parameters  | `X`                                 |
| Variable argument   | `buffer : Buffer<X>`                |
| Function argument   | `predicate : X -> Bool`             |
| Return type         | `(Buffer<X>)`                       |


```motoko
{{#include _mo/buffer/dropWhile.mo:a}}
```
