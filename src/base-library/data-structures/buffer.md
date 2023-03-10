# Buffer

The convention is to name the *module alias* after the *file name* it is defined in:

```motoko
{{#include _mo/buffer.mo:a}}
```

## Public items
The following types and functions are made public in the `Buffer` module: 
[Class `Buffer<X>`](#class)   
[Function `size`](#buffersize)  
[Function `add`](#bufferadd)  
[Function `get`](#bufferget)  
[Function `getOpt`](#buffergetOpt)  
[Function `put`](#bufferput)  
[Function `removeLast`](#bufferremovelast)  
[Function `remove`](#bufferremove)  
[Function `clear`](#bufferclear)  
[Function `filterEntries`](#bufferfilterentries)  
[Function `capacity`](#buffercapacity)  
[Function `reserve`](#bufferreserve)  
[Function `append`](#bufferappend)  
[Function `insert`](#bufferinsert)  
[Function `insertBuffer`](#bufferinsertbuffer)  
[Function `sort`](#buffersort)  
[Function `vals`](#buffervals)  
[Function `clone`](#bufferclone)  
[Function `toArray`](#buffertoarray)  
[Function `toVarArray`](#buffertovararray)  
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

### Function signature

```motoko
func thaw<X>(array : [X]) : [var X]
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

## Buffer.add


## Buffer.get

### Function signature

```motoko
func get(index : Nat) : X
```
### Parameters

|                     |                              |
| ------------------- | ----------------------       |
| Variable argument   | `index : Nat`                |
| Return type         | `X`                          |

### Example

```motoko
{{#include _mo/array/thaw.mo:a}}
```

### Execution Time and Memory Usage

## Buffer.getOpt


## Buffer.put


## Buffer.removeLast


## Buffer.remove


## Buffer.clear


## Buffer.filterEntries


## Buffer.capacity


## Buffer.reserve


## Buffer.append


## Buffer.insert


## Buffer.insertBuffer


## Buffer.sort


## Buffer.vals


## Buffer.clone


## Buffer.toArray


## Buffer.toVarArray


## Buffer.isEmpty


## Buffer.contains


## Buffer.clone


## Buffer.max


## Buffer.min


## Buffer.equal


## Buffer.compare


## Buffer.toText


## Buffer.hash


## Buffer.indexOf


## Buffer.lastIndexOf


## Buffer.indexOfBuffer


## Buffer.binarySearch


## Buffer.subBuffer


## Buffer.isSubBufferOf


## Buffer.isStrictSubBufferOf


## Buffer.prefix


## Buffer.isPrefixOf


## Buffer.isStrictPrefixOf


## Buffer.suffix


## Buffer.isSuffixOf


## Buffer.isStrictSuffixOf


## Buffer.forAll


## Buffer.forSome


## Buffer.forNone


## Buffer.toArray


## Buffer.toVarArray


## Buffer.fromArray


## Buffer.fromVarArray


## Buffer.fromIter


## Buffer.trimToSize


## Buffer.map


## Buffer.iterate


## Buffer.mapEntries


## Buffer.mapFilter


## Buffer.mapResult


## Buffer.chain


## Buffer.foldLeft


## Buffer.foldRight


## Buffer.first


## Buffer.last


## Buffer.make


## Buffer.reverse


## Buffer.merge


## Buffer.removeDuplicates


## Buffer.partition


## Buffer.split


## Buffer.chunk


## Buffer.groupBy


## Buffer.flatten


## Buffer.zip


## Buffer.zipWith


## Buffer.takeWhile


## Buffer.dropWhile


