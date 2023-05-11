# Stack

```motoko
{{#include _mo/stack/stack.mo:a}}
```

### On this page

[Class `Stack<T>`](#class-stackt)

[**Class methods**](#class-methods)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `push`](#stackpush)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `isEmpty`](#stackisempty)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `peek`](#stackpeek)  
&nbsp;&nbsp;&nbsp;&nbsp;[Method `pop`](#stackpop)

## Class `Stack<T>`

```motoko
class Stack<T>()
```

# Class methods

## Stack.push

```motoko
func push(x : T) : ()
```

```motoko, run
{{#include _mo/stack/push.mo:a}}
```

## Stack.isEmpty

```motoko
func isEmpty() : Bool
```

```motoko, run
{{#include _mo/stack/isEmpty.mo:a}}
```

## Stack.peek

```motoko
func peek() : ?T
```

```motoko, run
{{#include _mo/stack/peek.mo:a}}
```

## Stack.pop

```motoko
func pop() : ?T
```

```motoko, run
{{#include _mo/stack/pop.mo:a}}
```
