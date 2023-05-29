

# HashMap

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#imports) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/hashmap.mo:a}}
```

### On this page

[Type `HashMap.HashMap<K, V>`](#type-hashmaphashmapk-v)  
[Class `HashMap.HashMap<K, V>`](#class-hashmaphashmapk-v)

[**Class methods**](#class-methods)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `get`](#hashmapget)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `size`](#hashmapsize)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `put`](#hashmapput)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `replace`](#hashmapreplace)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `delete`](#hashmapdelete)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `remove`](#hashmapremove)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `keys`](#hashmapkeys)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `vals`](#hashmapvals)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `entries`](#hashmapentries)

[**Module public functions**](#module-public-functions)  
[Function `clone`](#hashmapclone)  
[Function `fromIter`](#hashmapfromiter)  
[Function `map`](#hashmapmap)  
[Function `mapFilter`](#hashmapmapfilter)

## Type `HashMap.HashMap<K, V>`

The `HashMap` module contains a [public type](/common-programming-concepts/modules.html#public-types-in-modules) `HashMap<K, V>` with the same name. It's convenient to [rename the type](/common-programming-concepts/modules.html#type-imports-and-renaming) locally:

```motoko
{{#include _mo/hashmap/type/type.mo:a}}
```

In the second line we declare a local [type alias](/common-programming-concepts/modules.html#type-imports-and-renaming) `HashMap<K, V>` by referring to the type inside the module. This new local type name takes in two [generic type parameters](/advanced-types/generics.html#type-parameters-and-type-arguments) `<K, V>`.

In the third line we declare another local alias `MapTextInt` which takes no parameters. It is always a `HashMap<Text, Int>`.

## Class `HashMap.HashMap<K, V>`

```motoko
HashMap.HashMap<K, V>(

  initCapacity : Nat,
  keyEq : (K, K) -> Bool,
  keyHash : K -> Hash.Hash

)
```

To construct a hashmap object, we use the `HashMap` class:

```motoko, run
{{#include _mo/hashmap/_class.mo:a}}
```

## Class methods

## hashmap.size

```motoko
func size() : Nat
```

The function `size` takes no argument and returns a `Nat` value.

```motoko, run
{{#include _mo/hashmap/size.mo:a}}
```

## hashmap.get

```motoko
func get(key : K) : (value : ?V)
```

The function `get` takes one argument of type `K` and returns a value of type `?V`.

```motoko, run
{{#include _mo/hashmap/get.mo:a}}
```

## hashmap.put

```motoko
func put(key : K, value : V)
```

The function `put` takes one argument of type `K` and returns a value of type `V`.

```motoko, run
{{#include _mo/hashmap/put.mo:a}}
```

## hashmap.replace

```motoko
func replace(key : K, value : V) : (oldValue : ?V)
```

The function `replace` takes one argument of type `K` and one of type `v` returns a value of type `?V`.

```motoko, run
{{#include _mo/hashmap/replace.mo:a}}
```

## hashmap.delete

```motoko
func delete(key : K)
```

The function `delete` takes one argument of type `K` and returns nothing.

```motoko, run
{{#include _mo/hashmap/delete.mo:a}}
```

## hashmap.remove

```motoko
func remove(key : K) : (oldValue : ?V)
```

The function `remove` takes one argument of type `K` and returns a value of type `?V`.

```motoko, run
{{#include _mo/hashmap/remove.mo:a}}
```

## hashmap.keys

```motoko
func keys() : Iter.Iter<K>
```

The function `keys` takes nothing and returns an `Iterator` of type `K`.

```motoko, run
{{#include _mo/hashmap/keys.mo:a}}
```

## hashmap.vals

```motoko
func vals() : Iter.Iter<V>
```

The function `vals` takes nothing and returns an `Iterator` of type `V`.

```motoko, run
{{#include _mo/hashmap/vals.mo:a}}
```

## hashmap.entries

```motoko
func entries() : Iter.Iter<(K, V)>
```

The function `entries` takes nothing and returns an `Iterator` of type tuple `(K, V)`.

```motoko, run
{{#include _mo/hashmap/entries.mo:a}}
```

## Module public functions

## HashMap.clone

```motoko
func clone<K, V>(

     map : HashMap<K, V>,
   keyEq : (K, K) -> Bool,
 keyHash : K -> Hash.Hash

  ) : HashMap<K, V>
```

| **Parameters**      |                            |
| ------------------- | -------------------------- |
| Generic parameters  | `K, V`                     |
| Variable argument   | `map : HashMap<K, V>`      |
| Function argument 1 | `keyEq : (K, K) -> Bool`   |
| Function argument 2 | `keyHash : K -> Hash.Hash` |
| Return type         | `HashMap<K, V>`            |

```motoko, run
{{#include _mo/hashmap/clone.mo:a}}
```

## HashMap.fromIter

```motoko
func fromIter<K, V>(

         iter : Iter.Iter<(K, V)>,
 initCapacity : Nat,
        keyEq : (K, K) -> Bool,
      keyHash : K -> Hash.Hash

    ) : HashMap<K, V>
```

| **Parameters**      |                            |
| ------------------- | -------------------------- |
| Generic parameters  | `K, V`                     |
| Variable argument1  | `iter : Iter.Iter<(K, V)>` |
| Variable argument2  | `initCapacity : Nat`       |
| Function argument 1 | `keyEq : (K, K) -> Bool`   |
| Function argument 2 | `keyHash : K -> Hash.Hash` |
| Return type         | `HashMap<K, V>`            |

```motoko, run
{{#include _mo/hashmap/fromIter.mo:a}}
```

## HashMap.map

```motoko
func map<K, V1, V2>(

 hashMap : HashMap<K, V1>,
   keyEq : (K, K) -> Bool,
 keyHash : K -> Hash.Hash,
       f : (K, V1) -> V2

   ) : HashMap<K, V2>
```

| **Parameters**      |                            |
| ------------------- | -------------------------- |
| Generic parameters  | `K, V1, V2`                |
| Variable argument1  | `hashMap : HashMap<K, V1>` |
| Function argument 1 | `keyEq : (K, K) -> Bool`   |
| Function argument 2 | `keyHash : K -> Hash.Hash` |
| Function argument 3 | `f : (K, V1) -> V2`        |
| Return type         | `HashMap<K, V2>`           |

```motoko, run
{{#include _mo/hashmap/map.mo:a}}
```

## HashMap.mapFilter

```motoko
func mapFilter<K, V1, V2>(

 hashMap : HashMap<K, V1>,
   keyEq : (K, K) -> Bool,
 keyHash : K -> Hash.Hash,
       f : (K, V1) -> ?V2

   ) : HashMap<K, V2>
```

| **Parameters**      |                            |
| ------------------- | -------------------------- |
| Generic parameters  | `K, V1, V2`                |
| Variable argument1  | `hashMap : HashMap<K, V1>` |
| Function argument 1 | `keyEq : (K, K) -> Bool`   |
| Function argument 2 | `keyHash : K -> Hash.Hash` |
| Function argument 3 | `f : (K, V1) -> ?V2`       |
| Return type         | `HashMap<K, V2>`           |

```motoko, run
{{#include _mo/hashmap/mapFilter.mo:a}}
```
