# Recursive Types

Lets ask everyone's favorite AI about recursive types:

**Q**: How would you define recursive types?

**ChatGPT**: _Recursive types are types that can contain values of the same type. This self-referential structure allows for the creation of complex data structures. Recursive types are commonly used in computer programming languages, particularly in functional programming languages, to represent recursive data structures such as trees or linked lists._

Wow! And since Motoko provides an [implementation](https://github.com/dfinity/motoko-base/blob/master/src/List.mo) of a _linked list_, a common [data structure](/base-library/data-structures.html) in programming languages, we will use that as an example.

## List

Consider the following type declaration in the [List](/base-library/data-structures/list.html) module in the [Base Library](/base-library.html):

```motoko
{{#include _mo/recursive.mo:a}}
```

A [generic type](/advanced-types/generics.html) `List<T>` is declared which takes one [type parameter](/advanced-types/generics.html#type-parameters-and-type-arguments) `T`. It is a [type alias](/common-programming-concepts/types.html#the-type-keyword) for an [option](/common-programming-concepts/options-and-results.html) of a [tuple](/common-programming-concepts/types/tuples.html) with two elements.

The first element of the tuple is the type parameter `T`, which could take on any type during the construction of a value of this `List<T>` type by providing a [type argument](/advanced-types/generics.html#type-arguments).

The second element of the tuple is `List<T>`. This is where the same type is used _recursively_. The type `List<T>` contains a value of itself in its own definition.

This means that a `List` is a _repeating pattern_ of elements. Each element is a tuple that contains a value of type `T` and a reference to the _tail_ `List<T>`. The tail is just another list element of the same type with the next value and tail for the next value and so on...

### Null list

Since our `List<T>` type is an option of a tuple, a value of type `<List<T>` could be `null` as long as we initialize a value with a [type argument](/advanced-types/generics.html#type-arguments) for `T`:

```motoko
{{#include _mo/recursive.mo:b}}
```

Our variable `list` has type `List<Nat>` (a list of `Nat` values) and happens to have the value `null`.

### The 'tail' of a list

The shortest list possible is a list with exactly one element. This means that it does not refer to a tail for the next value, because there is no next value.

```motoko
{{#include _mo/recursive.mo:c}}
```

The second element in the tuple, which should be of type `List<T>` is set to `null`. We use the [null list](/advanced-types/recursive-types.html#null-list) as the second element of the tuple. This list could serve as the last element of a larger list.

### The 'head' of a list

If we wanted to add another value to our list `list1` we could just define another value of type `List<T>` and have it point to `list1` as its tail:

```motoko
{{#include _mo/recursive.mo:d}}
```

`list2` is now called the head of the list (the first element) and `list1` is the tail of our 2-element list.

We could repeat this process by adding another element and using `list2` as the tail. We could do this as many times as we like (within [memory](/internet-computer-programming-concepts/basic-memory-persistence.html) limits) and construct a list of many values.

## Recursive functions

Suppose we have a list `bigList` with many elements. This means we are presented with a head of a list, which is a value of type `<List<T>`.

There several possibilities for this head value:

- The head value `bigList` could be the [null list](/advanced-types/recursive-types.html#null-list) and in that case it would not contain any values of type `T`.

- Another possibility is that the head value `bigList` has a value of type `T` but does not refer to a tail, making it a single element list, which could be the last element of a larger list.

- Another possibility is that the head value `bigList` contains one value of type `T` and a tail, which is another value of type `List<T>`.

These possibilities are used in the `last<T>` function of the [List module](/base-library/data-structures/list.html). This function is used to retrieve the last element of a given list:

```motoko
{{#include _mo/recursive.mo:e}}
```

We have a [generic function](/advanced-types/generics.html#generics-in-functions) `List<T>` with one [type parameter](/advanced-types/generics.html#type-parameters-and-type-arguments) `T`. It takes one argument `l` of type `List<T>`, which is going to be a head of some list.

If the function finds a last element, it returns an option of the value `?T` within it. If there is no last element it returns `null`.

In the function body, we [switch](/common-programming-concepts/control-flow/switch-expression.html) on the argument `l : List<T>` and are presented with the three possibilities described above.

- In the case that `l` is the [null list](#null-list), we return `null` because there would not be a last element.

- In the case that `l` is a list element `?(x, null)`, then we are dealing with the last element because there is not tail. We bind the name `x` to that last value by [pattern matching](/common-programming-concepts/pattern-matching.html) and return an option `?x` of that value as is required by our function signature.

- In the case that `l` is a list element `?(_, t)`, then there is a tail with a next value. We use the wildcard `_` because we don't care about the value in this element, because it is not the last value. We do care about the tail for which we bind the name `t`. We now use the function `last<T>` _recursively_ by calling it again inside itself and provide the tail `t` as the argument: `last<T>(t)`. The function is called again receiving a list which it now sees as a head that it can switch on again and so on until we find the last element. Pretty cool, if you ask me!
