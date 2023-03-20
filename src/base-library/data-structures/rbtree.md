# rbtree
The *convention* is to name the [*module alias*](/common-programming-concepts/modules.html#imports) after the [*file name*](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/rbtree.mo:a}}
```

## Public items
The following types and functions are made public in the `rbtree` module:   
[Type `Color`](#type)  
[Type `Tree`](#type)   
[Class `rbtree<K,V>`](#class)    
&nbsp;&nbsp;&nbsp;&nbsp;[Function `share`](#rbtreeshare)  
&nbsp;&nbsp;&nbsp;&nbsp;[Function `unShare`](#rbtreeunshare)  
&nbsp;&nbsp;&nbsp;&nbsp;[Function `get`](#rbtreeget)  
&nbsp;&nbsp;&nbsp;&nbsp;[Function `replace`](#rbtreereplace)  
&nbsp;&nbsp;&nbsp;&nbsp;[Function `put`](#rbtreeput)  
&nbsp;&nbsp;&nbsp;&nbsp;[Function `delete`](#rbtreedelete)  
&nbsp;&nbsp;&nbsp;&nbsp;[Function `remove`](#rbtreeremove)  
&nbsp;&nbsp;&nbsp;&nbsp;[Function `entries`](#rbtreeentries)  
&nbsp;&nbsp;&nbsp;&nbsp;[Function `entriesRev`](#rbtreeentriesrev)    
[Function `iter`](#rbtreeiter)  
[Function `size`](#rbtreesize)  

## RBTree.share

### Function signature

```motoko
func share() : Tree<K, V>
```
The function `share` takes no argument and returns an value of type `Tree<K, V>`. 

### Example

```motoko, run
{{#include _mo/rbtree/share.mo:a}}
```
## RBTree.unShare

### Function signature

```motoko
func unShare(t : Tree<K, V>) : ()
```

|   **Parameters**    |                        |
| ------------------- | ---------------------- |
| Variable argument   | `t : Tree<K, V>`       |
| Return type         | `()`                   |

### Example

```motoko, run
{{#include _mo/rbtree/unShare.mo:a}}
```

## RBTree.get

### Function signature

```motoko
func get(key : K) : ?V
```

|   **Parameters**    |                        |
| ------------------- | ---------------------- |
| Variable argument   | `key : K`              |
| Return type         | `?V`                   |

### Example

```motoko, run
{{#include _mo/rbtree/get.mo:a}}
```

## RBTree.replace 

### Function signature

```motoko
func replace(key : K, value : V) : ?V
```

|   **Parameters**    |                        |
| ------------------- | ---------------------- |
| Variable argument1  | `key : K`              |
| Variable argument2  | `value : V`            |
| Return type         | `?V`                   |

### Example

```motoko, run
{{#include _mo/rbtree/replace.mo:a}}
```

## RBTree.put 

### Function signature

```motoko
func put(key : K, value : V) : ()
```


|   **Parameters**    |                        |
| ------------------- | ---------------------- |
| Variable argument1  | `key : K`              |
| Variable argument2  | `value : V`            |
| Return type         | `()`                   |

### Example

```motoko, run
{{#include _mo/rbtree/put.mo:a}}
```

## RBTree.delete

### Function signature

```motoko
func delete(key : K) : ()
```


|   **Parameters**    |                        |
| ------------------- | ---------------------- |
| Variable argument   | `key : K`              |
| Return type         | `()`                   |

### Example

```motoko, run
{{#include _mo/rbtree/delete.mo:a}}
```

## RBTree.remove

### Function signature

```motoko
func remove(key : K) : ?V
```


|   **Parameters**    |                        |
| ------------------- | ---------------------- |
| Variable argument   | `key : K`              |
| Return type         | `?V`                   |

### Example

```motoko, run
{{#include _mo/rbtree/remove.mo:a}}
```

## RBTree.entries

### Function signature

```motoko
func entries() : I.Iter<(K, V)>
```
The function `entries` takes no argument and returns an value of type `I.Iter<(K, V)>`. 
### Example

```motoko, run
{{#include _mo/rbtree/entries.mo:a}}
```

## RBTree.entriesRev

### Function signature

```motoko
func entriesRev() : I.Iter<(K, V)>
```


|   **Parameters**    |                        |
| ------------------- | ---------------------- |
| Variable argument   | `()`                   |
| Return type         | `I.Iter<(K, V)>`       |

### Example

```motoko, run
{{#include _mo/rbtree/entriesRev.mo:a}}
```

## RBTree.iter

### Function signature

```motoko
func iter<X, Y>(

  tree : Tree<X, Y>
  direction : {#fwd; #bwd}
  
) : I.Iter<(X, Y)>
```


|   **Parameters**    |                            |
| ------------------- | ----------------------     |
| Generic parameters  | `X, Y`                     |
| Variable argument1  | `tree : Tree<X< Y>`        |
| Variable argument2  | `direction : {#fwd; #bwd}` |
| Return type         | `I.Iter<(X, Y)>`           |

### Example

```motoko, run
{{#include _mo/rbtree/iter.mo:a}}
```

## RBTree.size

### Function signature

```motoko
func size<X, Y>(

  t : Tree<X, Y>

) : Nat
```


|   **Parameters**    |                            |
| ------------------- | ----------------------     |
| Generic parameters  | `X, Y`                     |
| Variable argument   | `t : Tree<X< Y>`           |
| Return type         | `Nat`                      |

### Example

```motoko, run
{{#include _mo/rbtree/size.mo:a}}
```




