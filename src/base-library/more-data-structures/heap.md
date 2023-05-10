# Heap

```motoko
{{#include _mo/heap/heap.mo:a}}
```

### On this page

[Type `Tree`](#type-tree)  
[Class `Heap<X>`](#class-heapx)

[Function `put`](#heapput)  
[Function `peekMin`](#heappeekmin)  
[Function `deleteMin`](#heapdeletemin)  
[Function `removeMin`](#heapremovemin)  
[Function `share`](#heapshare)  
[Function `unsafeUnshare`](#heapunsafeunshare)  
[Function `fromIter`](#heapfromiter)

## Type `Tree`

```motoko
type Tree<X> = ?(Int, X, Tree<X>, Tree<X>)
```

## Class `Heap<X>`

```motoko
class Heap<X>(compare : (X, X) -> O.Order)
```

## Heap.put

```motoko
func put(x : X) : ()
```

```motoko, run
{{#include _mo/heap/put.mo:a}}
```

## Heap.peekMin

```motoko
func peekMin() : ?X
```

```motoko, run
{{#include _mo/heap/peekMin.mo:a}}
```

## Heap.deleteMin

```motoko
func deleteMin() : ()
```

```motoko, run
{{#include _mo/heap/deleteMin.mo:a}}
```

## Heap.removeMin

```motoko
func removeMin() : (minElement : ?X)
```

```motoko, run
{{#include _mo/heap/removeMin.mo:a}}
```

## Heap.share

```motoko
func share() : Tree<X>
```

```motoko, run
{{#include _mo/heap/share.mo:a}}
```

## Heap.unsafeUnshare

```motoko
func unsafeUnshare(tree : Tree<X>)
```

```motoko, run
{{#include _mo/heap/unsafeUnshare.mo:a}}
```

## Heap.fromIter

```motoko
func fromIter<X>(iter : I.Iter<X>, compare : (X, X) -> O.Order) : Heap<X>
```

```motoko, run
{{#include _mo/heap/fromIter.mo:a}}
```
