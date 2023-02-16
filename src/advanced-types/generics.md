# Generics
Let's ask [ChatGPT](https://chat.openai.com/) how it would explain *generic types* to a beginner:

Q: How would you explain generic typing to a beginner?  

ChatGPT: *Generics are a way of creating flexible and reusable code in programming. They allow you to write functions, classes, and data structures that can work with different types of data without specifying the type ahead of time.* 

In our own words, generic types allow us to write code that *generalizes* over many possible types. In fact, that is where they get there name from. 

## Type arguments
In Motoko, [custom types](/common-programming-concepts/types.html#the-type-keyword), functions and classes can take in *generic type arguments*. Type arguments have names like variables and are supplied by adding them in between angle brackets `< >`. The angle brackets are supplied directly after the *name* of the type, function or class. 

The names of generic types are by convention single capital letters like `T` and `U` or (short) words that start with a capital letter like `Ok` and `Err`. 

Here's a custom type alias for a tuple, that has the conventional generic type name `T`:
```motoko
{{#include _mo/type-args.mo:a}}
```

The type argument is supplied after the name `CustomType<T>`. Then the generic type is used inside the tuple. This indicates that an instance of `CustomType` will have *some* type `T` in the tuple without knowing ahead of type what type that would be.

Lets use our `CustomType`:
```motoko
{{#include _mo/type-args.mo:b}}
```

The `CustomType` is used to annotate our variable `x`. When we actually *use* the type with generic parameters, we have to specify a specific type for `T`. In the example, we used `Bool`. Then we wrote a tuple of values, and used a `true` value where a value of type `T` was expected.

> **NOTE**
> *Public shared functions are not allowed to have generic type arguments.* 

## Generics in type declarations
A commonly used generic type is the `Result` variant type that is available as a public type in the [Base Library](/base-library.html) in the [Result module](/base-library/utils/result.html). 

Here's it's definition:
```motoko
{{#include _mo/generics.mo:a}}
```

## Generics in function declarations

## Generics in classes