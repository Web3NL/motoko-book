> **BETA WARNING** _This chapter is being reviewed and updated_

# Deque

```motoko
{{#include _mo/deque/deque.mo:a}}
```

### On this page

[Type `Deque`](#type-deque)

[Function `empty`](#dequeempty)  
[Function `isEmpty`](#dequeisempty)  
[Function `pushFront`](#dequepushfront)  
[Function `peekFront`](#dequepeekfront)  
[Function `popFront`](#dequepopfront)  
[Function `pushBack`](#dequepushback)  
[Function `peekBack`](#dequepeekback)  
[Function `popBack`](#dequepopback)

## Type `Deque`

```motoko
type Deque<T> = (List<T>, List<T>)
```

## Deque.empty

```motoko
func empty<T>() : Deque<T>
```

```motoko, run
{{#include _mo/deque/empty.mo:a}}
```

## Deque.isEmpty

```motoko
func isEmpty<T>(deque : Deque<T>) : Bool
```

```motoko, run
{{#include _mo/deque/isEmpty.mo:a}}
```

## Deque.pushFront

```motoko
func pushFront<T>(deque : Deque<T>, element : T) : Deque<T>
```

```motoko, run
{{#include _mo/deque/pushFront.mo:a}}
```

## Deque.peekFront

```motoko
func peekFront<T>(deque : Deque<T>) : ?T
```

```motoko, run
{{#include _mo/deque/peekFront.mo:a}}
```

## Deque.popFront

```motoko
func popFront<T>(deque : Deque<T>) : ?(T, Deque<T>)
```

```motoko, run
{{#include _mo/deque/popFront.mo:a}}
```

## Deque.pushBack

```motoko
func pushBack<T>(deque : Deque<T>, element : T) : Deque<T>
```

```motoko, run
{{#include _mo/deque/pushBack.mo:a}}
```

## Deque.peekBack

```motoko
func peekBack<T>(deque : Deque<T>) : ?T
```

```motoko, run
{{#include _mo/deque/peekBack.mo:a}}
```

## Deque.popBack

```motoko
func popBack<T>(deque : Deque<T>) : ?(Deque<T>, T)
```

```motoko, run
{{#include _mo/deque/popBack.mo:a}}
```
