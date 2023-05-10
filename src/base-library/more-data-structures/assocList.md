# AssocList

```motoko, run
{{#include _mo/assocList/assocList.mo:a}}
```

### On this page

[Type `AssocList`](#type-assoclist)

[Function `find`](#assoclistfind)  
[Function `replace`](#assoclistreplace)  
[Function `diff`](#assoclistdiff)  
[Function `disjDisjoint`](#assoclistdisjdisjoint)  
[Function `disj`](#assoclistdisj)  
[Function `join`](#assoclistjoin)  
[Function `fold`](#assoclistfold)

## Type `AssocList`

```motoko
type AssocList<K, V> = List.List<(K, V)>
```

## AssocList.find

```motoko
func find<K, V>(
    map : AssocList<K, V>,
    key : K,
    equal : (K, K) -> Bool
    ) : ?V
```

| **Parameters**     |                          |
| ------------------ | ------------------------ |
| Generic parameters | `K, V`                   |
| Variable argument1 | `map : AssocList<K, V>`  |
| Variable argument2 | `key : K`                |
| Function argument  | `equal : (K, K) -> Bool` |
| Return type        | `?V`                     |

```motoko, run
{{#include _mo/assocList/find.mo:a}}
```

## AssocList.replace

```motoko
func replace<K, V>(
    map : AssocList<K, V>,
    key : K,
    equal : (K, K) -> Bool,
    value : ?V
    ) : (AssocList<K, V>, ?V)
```

| **Parameters**     |                          |
| ------------------ | ------------------------ |
| Generic parameters | `K, V`                   |
| Variable argument1 | `map : AssocList<K, V>`  |
| Variable argument2 | `key : K`                |
| Variable argument3 | `value : ?V`             |
| Function argument  | `equal : (K, K) -> Bool` |
| Return type        | `(AssocList<K, V>, ?V)`  |

```motoko, run
{{#include _mo/assocList/replace.mo:a}}
```

## AssocList.diff

```motoko
func diff<K, V, W>(
    map1 : AssocList<K, V>,
    map2 : AssocList<K, W>,
    equal : (K, K) -> Bool
    ) : AssocList<K, V>
```

| **Parameters**     |                          |
| ------------------ | ------------------------ |
| Generic parameters | `K, V, W`                |
| Variable argument1 | `map1 : AssocList<K, V>` |
| Variable argument2 | `map2 : AssocList<K, W>` |
| Function argument  | `equal : (K, K) -> Bool` |
| Return type        | `AssocList<K, V>`        |

```motoko, run
{{#include _mo/assocList/diff.mo:a}}
```

## AssocList.disjDisjoint

```motoko
func disjDisjoint<K, V, W, X>(
    map1 : AssocList<K, V>,
    map2 : AssocList<K, W>,
    f : (?V, ?W) -> X
    ) : AssocList<K, X>
```

| **Parameters**     |                          |
| ------------------ | ------------------------ |
| Generic parameters | `K, V, W, X`             |
| Variable argument1 | `map1 : AssocList<K, V>` |
| Variable argument2 | `map2 : AssocList<K, W>` |
| Function argument  | `f : (?V, ?W) -> X`      |
| Return type        | `AssocList<K, X>`        |

```motoko, run
{{#include _mo/assocList/disjDisjoint.mo:a}}
```

## AssocList.disj

```motoko
func disj<K, V, W, X>(
    map1 : AssocList<K, V>,
    map2 : AssocList<K, W>,
    equal : (K, K) -> Bool,
    combine : (?V, ?W) -> X
    ) : AssocList<K, X>
```

| **Parameters**     |                           |
| ------------------ | ------------------------- |
| Generic parameters | `K, V, W, X`              |
| Variable argument1 | `map1 : AssocList<K, V>`  |
| Variable argument2 | `map2 : AssocList<K, W>`  |
| Function argument1 | `equal : (K, K) -> Bool`  |
| Function argument2 | `combine : (?V, ?W) -> X` |
| Return type        | `AssocList<K, X>`         |

```motoko, run
{{#include _mo/assocList/disj.mo:a}}
```

## AssocList.join

```motoko
func join<K, V, W, X>(
    map1 : AssocList<K, V>,
    map2 : AssocList<K, W>,
    equal : (K, K) -> Bool,
    combine : (V, W) -> X
    ) : AssocList<K, X>
```

| **Parameters**     |                          |
| ------------------ | ------------------------ |
| Generic parameters | `K, V, W, X`             |
| Variable argument1 | `map1 : AssocList<K, V>` |
| Variable argument2 | `map2 : AssocList<K, W>` |
| Function argument1 | `equal : (K, K) -> Bool` |
| Function argument2 | `combine : (V, W) -> X`  |
| Return type        | `AssocList<K, X>`        |

```motoko, run
{{#include _mo/assocList/join.mo:a}}
```

## AssocList.fold

```motoko
func fold<K, V, X>(
    map : AssocList<K, V>,
    base : X,
    combine : (K, V, X) -> X
    ) : X
```

| **Parameters**     |                            |
| ------------------ | -------------------------- |
| Generic parameters | `K, V, X`                  |
| Variable argument1 | `map : AssocList<K, V>`    |
| Variable argument2 | `base : X`                 |
| Function argument  | `combine : (K, V, X) -> X` |
| Return type        | `X`                        |

```motoko, run
{{#include _mo/assocList/fold.mo:a}}
```
