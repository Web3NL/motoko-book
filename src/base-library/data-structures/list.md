# List
> **NOTE**  
> *The difference between a list and an array is that an array is stored as one contiguous block of bytes in memory and a list is 'scattered' around without the elements having to be adjacent to each other. The advantage is that we can use memory more efficiently by filling the memory more flexibly. The downside is that for operations on the whole list, we have to visit each element one by one which may be computationally expensive.*

The convention is to name the *module alias* after the *file name* it is defined in:

```motoko
{{#include _mo/list.mo:a}}
```

## Public items
The following types and functions are made public in the `List` module:   
[Type `List`](#type)    
[Function `nil`](#listnil)  
[Function `isNil`](#listisnil)  
[Function `push`](#listpush)  
[Function `last`](#listlast)  
[Function `pop`](#listpop)  
[Function `size`](#listsize)  
[Function `get`](#listget)  
[Function `reverse`](#listreverse)  
[Function `iterate`](#listiterate)  
[Function `map`](#listmap)  
[Function `filter`](#listfilter)  
[Function `partition`](#listpartition)  
[Function `mapFilter`](#listmapfilter)  
[Function `mapResult`](#listmapresult)  
[Function `append`](#listappend)  
[Function `flatten`](#listflatten)  
[Function `take`](#listtake)  
[Function `drop`](#listdrop)  
[Function `foldLeft`](#listfoldleft)  
[Function `foldRight`](#listfoldright)  
[Function `find`](#listfind)  
[Function `some`](#listsome)  
[Function `all`](#listall)  
[Function `merge`](#listmerge)  
[Function `compare`](#listcompare)  
[Function `equal`](#listequal)  
[Function `tabulate`](#listtabulate)  
[Function `make`](#listmake)  
[Function `replicate`](#listreplicate)  
[Function `zip`](#listzip)  
[Function `zipWith`](#listzipwith)  
[Function `split`](#listsplit)  
[Function `chunks`](#listchunks)  
[Function `fromArray`](#listfromarray)  
[Function `fromVarArray`](#listfromvararray)  
[Function `toArray`](#listtoarray)  
[Function `toVarArray`](#listtovararray)  
[Function `toIter`](#listtoiter) 

## Type


## List.nil


## List.isNil


## List.push


## List.last


## List.pop


## List.size


## List.get


## List.reverse


## List.iterate


## List.map


## List.filter


## List.partition


## List.mapFilter


## List.mapResult


## List.append


## List.flatten


## List.take


## List.drop


## List.foldLeft


## List.foldRight


## List.find


## List.some


## List.all


## List.merge


## List.compare


## List.equal


## List.tabulate


## List.make


## List.replicate


## List.zip


## List.zipWith


## List.split


## List.chunks


## List.fromArray


## List.fromVarArray


## List.toArray


## List.toVarArray


## List.toIter





