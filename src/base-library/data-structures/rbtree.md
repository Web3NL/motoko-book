# RBTree
The convention is to name the [*module alias*](/common-programming-concepts/modules.html#imports) after the [*file name*](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/rbtree.mo:a}}
```

## Public items
The following types and functions are made public in the `RBtree` module:   
[Type `Color`](#type)  
[Type `Tree`](#type)   
[Class `RBTree<K,V>`](#class)  
[Function `share`](#rbtreeshare)  
[Function `unShare`](#rbtreeunshare)  
[Function `get`](#rbtreeget)  
[Function `replace`](#rbtreereplace)  
[Function `put`](#rbtreeput)  
[Function `delete`](#rbtreedelete)  
[Function `remove`](#rbtreeremove)  
[Function `entries`](#rbtreeentries)  
[Function `entriesRev`](#rbtreeentriesrev)  
[Function `iter`](#rbtreeiter)  
[Function `size`](#rbtreesize)  


## Type


## Type


## Class


## RBtree.share

### Function signature

```motoko
func share<X>(

  ()
  
) : 
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
{{#include _mo/rbtree/share.mo:a}}
```

### Execution Time and Memory Usage


## RBtree.unShare

### Function signature

```motoko
func unShare<X>(

  t : Tree<K, V>
  
) : ()
```

### Parameters

|                     |                        |
| ------------------- | ---------------------- |
| Generic parameters  | `X`                    |
| Variable argument 1 | `t : Tree<K, V>`       |
| Return type         | `()`                   |

### Example

```motoko
{{#include _mo/rbtree/unShare.mo:a}}
```

### Execution Time and Memory Usage


## RBtree.get

### Function signature

```motoko
func get<X>(

  key : K
  
) : ?V
```

### Parameters

|                     |                        |
| ------------------- | ---------------------- |
| Generic parameters  | `X`                    |
| Variable argument   | `key : K`              |
| Return type         | `?V`                   |

### Example

```motoko
{{#include _mo/rbtree/get.mo:a}}
```

### Execution Time and Memory Usage



## RBtree.replace 

### Function signature

```motoko
func replace<X>(

  key : K

  value : V
  
) : ?V
```

### Parameters

|                     |                        |
| ------------------- | ---------------------- |
| Generic parameters  | `X`                    |
| Variable argument1  | `key : K`              |
| Variable argument2  | `value : V`            |
| Return type         | `?V`                   |

### Example

```motoko
{{#include _mo/rbtree/replace.mo:a}}
```

### Execution Time and Memory Usage



## RBtree.put 

### Function signature

```motoko
func put<X>(

  key : K

  value : V
  
) : 
```

### Parameters

|                     |                        |
| ------------------- | ---------------------- |
| Generic parameters  | `X`                    |
| Variable argument1  | `key : K`              |
| Variable argument2  | `value : V`            |
| Return type         | ``                   |

### Example

```motoko
{{#include _mo/rbtree/put.mo:a}}
```

### Execution Time and Memory Usage



## RBtree.delete

### Function signature

```motoko
func delete<X>(

  key : K
  
) : 
```

### Parameters

|                     |                        |
| ------------------- | ---------------------- |
| Generic parameters  | `X`                    |
| Variable argument   | `key : K`              |
| Return type         | ``                     |

### Example

```motoko
{{#include _mo/rbtree/delete.mo:a}}
```

### Execution Time and Memory Usage



## RBtree.remove

### Function signature

```motoko
func remove<X>(

  key : K
  
) : ?V
```

### Parameters

|                     |                        |
| ------------------- | ---------------------- |
| Generic parameters  | `X`                    |
| Variable argument   | `key : K`              |
| Return type         | `?V`                   |

### Example

```motoko
{{#include _mo/rbtree/remove.mo:a}}
```

### Execution Time and Memory Usage



## RBtree.entries

### Function signature

```motoko
func entries<X>(

  
  
) : I.Iter<(K, V)>
```

### Parameters

|                     |                        |
| ------------------- | ---------------------- |
| Generic parameters  | `X`                    |
| Variable argument   | ``                     |
| Return type         | `I.Iter<(K, V)>`       |

### Example

```motoko
{{#include _mo/rbtree/entries.mo:a}}
```

### Execution Time and Memory Usage



## RBtree.entriesRev

### Function signature

```motoko
func entriesRev<X>(

  
  
) : I.Iter<(K, V)>
```

### Parameters

|                     |                        |
| ------------------- | ---------------------- |
| Generic parameters  | `X`                    |
| Variable argument   | ``                     |
| Return type         | `I.Iter<(K, V)>`       |

### Example

```motoko
{{#include _mo/rbtree/entriesRev.mo:a}}
```

### Execution Time and Memory Usage



## RBtree.iter

### Function signature

```motoko
func iter<X, Y>(

  tree : Tree<X, Y>

  direction : {#fwd; #bwd}
  
) : I.Iter<(X, Y)>
```

### Parameters

|                     |                            |
| ------------------- | ----------------------     |
| Generic parameters  | `X`                        |
| Generic parameters  | `Y`                        |
| Variable argument   | `tree : Tree<X< Y>`        |
| Variable argument   | `direction : {#fwd; #bwd}` |
| Return type         | `I.Iter<(X, Y)>`           |

### Example

```motoko
{{#include _mo/rbtree/iter.mo:a}}
```

### Execution Time and Memory Usage


## Rbtree.size

### Function signature

```motoko
func size<X, Y>(

  t : Tree<X, Y>

) : Nat
```

### Parameters

|                     |                            |
| ------------------- | ----------------------     |
| Generic parameters  | `X`                        |
| Generic parameters  | `Y`                        |
| Variable argument   | `t : Tree<X< Y>`           |
| Return type         | `Nat`                      |

### Example

```motoko
{{#include _mo/rbtree/size.mo:a}}
```

### Execution Time and Memory Usage






