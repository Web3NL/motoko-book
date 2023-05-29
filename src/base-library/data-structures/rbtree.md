

# RBTree

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#imports) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/rbtree.mo:a}}
```

### On this page

[Type `RBTree.Color`](#type-rbtreecolor)  
[Type `RBTree.Tree<K, V>`](#type-rbtreetreek-v)  
[Class `RBTree.RBtree<K, V>`](#class-rbtreerbtreekv)

[**Class methods**](#class-methods)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `share`](#rbtreeshare)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `unShare`](#rbtreeunshare)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `get`](#rbtreeget)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `replace`](#rbtreereplace)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `put`](#rbtreeput)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `delete`](#rbtreedelete)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `remove`](#rbtreeremove)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `entries`](#rbtreeentries)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `entriesRev`](#rbtreeentriesrev)

[**Module public functions**](#module-public-functions)  
[Function `iter`](#rbtreeiter)  
[Function `size`](#rbtreesize)

## Type `RBTree.Color`

```motoko
{{#include _mo/rbtree/type/color.mo:a}}
```

## Type `RBTree.Tree<K, V>`

```motoko
{{#include _mo/rbtree/type/tree.mo:a}}
```

## Class `RBTree.RBtree<K,V>`

```motoko
class RBTree<K, V>(compare : (K, K) -> O.Order)
```

To construct a rbtree object, we use the `RBTree` class:

```motoko, run
{{#include _mo/rbtree/_class.mo:a}}
```

## Class methods

## rbtree.share

```motoko
func share() : Tree<K, V>
```

The function `share` takes no argument and returns an value of type `Tree<K, V>`.

### Example

```motoko, run
{{#include _mo/rbtree/share.mo:a}}
```

## rbtree.unShare

```motoko
func unShare(t : Tree<K, V>) : ()
```

| **Parameters**    |                  |
| ----------------- | ---------------- |
| Variable argument | `t : Tree<K, V>` |
| Return type       | `()`             |

### Example

```motoko, run
{{#include _mo/rbtree/unShare.mo:a}}
```

## rbtree.get

```motoko
func get(key : K) : ?V
```

| **Parameters**    |           |
| ----------------- | --------- |
| Variable argument | `key : K` |
| Return type       | `?V`      |

### Example

```motoko, run
{{#include _mo/rbtree/get.mo:a}}
```

## rbtree.replace

```motoko
func replace(key : K, value : V) : ?V
```

| **Parameters**     |             |
| ------------------ | ----------- |
| Variable argument1 | `key : K`   |
| Variable argument2 | `value : V` |
| Return type        | `?V`        |

### Example

```motoko, run
{{#include _mo/rbtree/replace.mo:a}}
```

## rbtree.put

```motoko
func put(key : K, value : V) : ()
```

| **Parameters**     |             |
| ------------------ | ----------- |
| Variable argument1 | `key : K`   |
| Variable argument2 | `value : V` |
| Return type        | `()`        |

### Example

```motoko, run
{{#include _mo/rbtree/put.mo:a}}
```

## rbtree.delete

```motoko
func delete(key : K) : ()
```

| **Parameters**    |           |
| ----------------- | --------- |
| Variable argument | `key : K` |
| Return type       | `()`      |

### Example

```motoko, run
{{#include _mo/rbtree/delete.mo:a}}
```

## rbtree.remove

```motoko
func remove(key : K) : ?V
```

| **Parameters**    |           |
| ----------------- | --------- |
| Variable argument | `key : K` |
| Return type       | `?V`      |

### Example

```motoko, run
{{#include _mo/rbtree/remove.mo:a}}
```

## rbtree.entries

```motoko
func entries() : I.Iter<(K, V)>
```

The function `entries` takes no argument and returns an value of type `I.Iter<(K, V)>`.

### Example

```motoko, run
{{#include _mo/rbtree/entries.mo:a}}
```

## rbtree.entriesRev

```motoko
func entriesRev() : I.Iter<(K, V)>
```

| **Parameters**    |                  |
| ----------------- | ---------------- |
| Variable argument | `()`             |
| Return type       | `I.Iter<(K, V)>` |

### Example

```motoko, run
{{#include _mo/rbtree/entriesRev.mo:a}}
```

## Module public functions

## RBTree.iter

```motoko
func iter<X, Y>(

  tree : Tree<X, Y>,
  direction : {#fwd; #bwd}

) : I.Iter<(X, Y)>
```

| **Parameters**     |                            |
| ------------------ | -------------------------- |
| Generic parameters | `X, Y`                     |
| Variable argument1 | `tree : Tree<X< Y>`        |
| Variable argument2 | `direction : {#fwd; #bwd}` |
| Return type        | `I.Iter<(X, Y)>`           |

### Example

```motoko, run
{{#include _mo/rbtree/iter.mo:a}}
```

## RBTree.size

```motoko
func size<X, Y>(

  t : Tree<X, Y>

) : Nat
```

| **Parameters**     |                  |
| ------------------ | ---------------- |
| Generic parameters | `X, Y`           |
| Variable argument  | `t : Tree<X< Y>` |
| Return type        | `Nat`            |

### Example

```motoko, run
{{#include _mo/rbtree/size.mo:a}}
```
