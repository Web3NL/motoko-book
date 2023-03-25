# HashMap
The *convention* is to name the [*module alias*](/common-programming-concepts/modules.html#imports) after the [*file name*](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/hashmap.mo:a}}
```

### On this page
[Type `HashMap.HashMap<K, V>`](#type-hashmaphashmapkv)

[Class `HashMap.HashMap<K, V>(initCapacity : Nat, keyEq : (K, K) -> Bool, keyHash : K -> Hash.Hash)`](#class-hashmaphashmapkv)     
&nbsp;&nbsp;&nbsp;&nbsp;[Function `get`](#hashmapget)  
&nbsp;&nbsp;&nbsp;&nbsp;[Function `size`](#hashmapsize)  
&nbsp;&nbsp;&nbsp;&nbsp;[Function `put`](#hashmapput)  
&nbsp;&nbsp;&nbsp;&nbsp;[Function `replace`](#hashmapreplace)  
&nbsp;&nbsp;&nbsp;&nbsp;[Function `delete`](#hashmapdelete)  
&nbsp;&nbsp;&nbsp;&nbsp;[Function `remove`](#hashmapremove)  
&nbsp;&nbsp;&nbsp;&nbsp;[Function `keys`](#hashmapkeys)  
&nbsp;&nbsp;&nbsp;&nbsp;[Function `vals`](#hashmapvals)  
&nbsp;&nbsp;&nbsp;&nbsp;[Function `entries`](#hashmapentries)  
[Function `clone`](#hashmapclone)  
[Function `fromIter`](#hashmapfromiter)  
[Function `map`](#hashmapmap)  
[Function `mapFilter`](#hashmapmapfilter)  

## Type `HashMap.HashMap<K, V>`

The `HashMap` module contains a [public type](/common-programming-concepts/modules.html#public-types-in-modules) `HashMap<K, V>` with the same name. It's convenient to [rename the type](/common-programming-concepts/modules.html#type-imports-and-renaming) locally:

```motoko
{{#include _mo/hashmap/type/type.mo:a}}
```

In the first line we declare a local [type alias](/common-programming-concepts/modules.html#type-imports-and-renaming) `HashMap<K, V>` by referring to the type inside the module. This new local type name takes in a [generic type parameter](/advanced-types/generics.html#type-parameters-and-type-arguments) `<K, V>`.

In the second line we declare another local alias `BufNat` which takes no parameters. It is always a `HashMap` of `Nat`.

## Class `HashMap.HashMap<K, V>`

```motoko
HashMap.HashMap<K, V>(initCapacity : Nat, keyEq : (K, K) -> Bool, keyHash : K -> Hash.Hash)
```

The `HashMap<K, V>` class takes one argument `initCapacity` of type `Nat`, which represent the initial capacity of the buffer.

To construct a buffer object, we use the `HashMap` class:

```motoko, run
{{#include _mo/hashmap/_class.mo:a}}
```

We construct an [object](/common-programming-concepts/objects-and-classes/objects.html) `myBuffer` of type `HashMap<Nat>` by calling the [class](/common-programming-concepts/objects-and-classes/classes.html) `HashMap.HashMap` with type parameter `Nat` and initial capacity `100`.  
 

## Hashmap.size

```motoko
func size() : Nat
```
The function `size` takes no argument and returns a `Nat` value.  

```motoko, run
{{#include _mo/hashmap/size.mo:a}}  
```

## Hashmap.get

```motoko
func get(key : K) : (value : ?V)
```
The function `get` takes one argument of type `K` and returns a value of type `?V`.  

```motoko, run
{{#include _mo/hashmap/get.mo:a}}
```

## Hashmap.put

```motoko
func put(key : K, value : V)
```
The function `put` takes one argument of type `K` and returns a value of type `V`.  

```motoko, run
{{#include _mo/hashmap/put.mo:a}}
```

## Hashmap.replace

```motoko
func replace(key : K, value : V) : (oldValue : ?V)
```
The function `replace` takes one argument of type `K` and one of type `v` returns a value of type `?V`.  

```motoko, run
{{#include _mo/hashmap/replace.mo:a}}
```

## Hashmap.delete

```motoko
func delete(key : K)
```
The function `delete` takes one argument of type `K` and returns nothing.  

```motoko, run
{{#include _mo/hashmap/delete.mo:a}}
```

## Hashmap.remove

```motoko
func remove(key : K) : (oldValue : ?V)
```
The function `remove` takes one argument of type `K` and returns a value of type `?V`.  

```motoko, run
{{#include _mo/hashmap/remove.mo:a}}
```

## Hashmap.keys

```motoko
func keys() : Iter.Iter<K>
```
The function `keys` takes nothing and returns an `Iterator` of type `K`.  

```motoko, run
{{#include _mo/hashmap/keys.mo:a}}
```

## Hashmap.vals

```motoko
func vals() : Iter.Iter<V>
```
The function `vals` takes nothing and returns an `Iterator` of type `V`.

```motoko, run
{{#include _mo/hashmap/vals.mo:a}}
```

## Hashmap.entries

```motoko
func entries() : Iter.Iter<(K, V)>
```
The function `entries` takes nothing and returns an `Iterator` of type tuple `(K, V)`.  

```motoko, run
{{#include _mo/hashmap/entries.mo:a}}
```

## Hashmap.clone
### Function signature

```motoko
func clone<K, V>(
    
     map : HashMap<K, V>
   keyEq : (K, K) -> Bool
 keyHash : K -> Hash.Hash
      
  ) : HashMap<K, V>
```

|   **Parameters**    |                              |
| ------------------- | ---------------------------- |
| Generic parameters  | `K, V`                       |
| Variable argument   | `map : HashMap<K, V>`        |
| Function argument 1 | `keyEq : (K, K) -> Bool`     |
| Function argument 2 | `keyHash : K -> Hash.Hash`   |
| Return type         | `HashMap<K, V>`              |


```motoko, run
{{#include _mo/hashmap/clone.mo:a}}
```

## Hashmap.fromIter

### Function signature

```motoko
func fromIter<K, V>(
    
         iter : Iter.Iter<(K, V)>
 initCapacity : Nat
        keyEq : (K, K) -> Bool
      keyHash : K -> Hash.Hash
       
    ) : HashMap<K, V>
```

|   **Parameters**    |                              |
| ------------------- | ---------------------------- |
| Generic parameters  | `K, V`                       |
| Variable argument1  | `iter : Iter.Iter<(K, V)>`   |
| Variable argument2  | `initCapacity : Nat`         |
| Function argument 1 | `keyEq : (K, K) -> Bool`     |
| Function argument 2 | `keyHash : K -> Hash.Hash`   |
| Return type         | `HashMap<K, V>`              |


```motoko, run
{{#include _mo/hashmap/fromIter.mo:a}}
```

## Hashmap.map

### Function signature

```motoko
func map<K, V1, V2>(
    
 hashMap : HashMap<K, V1>
   keyEq : (K, K) -> Bool
 keyHash : K -> Hash.Hash
       f : (K, V1) -> V2
       
   ) : HashMap<K, V2>
```


|   **Parameters**    |                              |
| ------------------- | ---------------------------- |
| Generic parameters  | `K, V1, V2`                  |
| Variable argument1  | `hashMap : HashMap<K, V1>`   |
| Function argument 1 | `keyEq : (K, K) -> Bool`     |
| Function argument 2 | `keyHash : K -> Hash.Hash`   |
| Function argument 3 | `f : (K, V1) -> V2`          |
| Return type         | `HashMap<K, V2>`             |


```motoko, run
{{#include _mo/hashmap/map.mo:a}}
```

## Hashmap.mapFilter

### Function signature

```motoko
func mapFilter<K, V1, V2>(
    
 hashMap : HashMap<K, V1>
   keyEq : (K, K) -> Bool
 keyHash : K -> Hash.Hash
       f : (K, V1) -> ?V2
       
   ) : HashMap<K, V2>
```


|   **Parameters**    |                              |
| ------------------- | ---------------------------- |
| Generic parameters  | `K, V1, V2`                  |
| Variable argument1  | `hashMap : HashMap<K, V1>`   |
| Function argument 1 | `keyEq : (K, K) -> Bool`     |
| Function argument 2 | `keyHash : K -> Hash.Hash`   |
| Function argument 3 | `f : (K, V1) -> ?V2`         |
| Return type         | `HashMap<K, V2>`             |


```motoko, run
{{#include _mo/hashmap/mapFilter.mo:a}}
```
