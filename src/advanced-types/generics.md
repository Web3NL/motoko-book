# Generics
Let's ask [ChatGPT](https://chat.openai.com/) how it would explain *generic types* to a beginner:

Q: How would you explain generic typing to a beginner?  

ChatGPT: *Generics are a way of creating flexible and reusable code in programming. They allow you to write functions, classes, and data structures that can work with different types of data without specifying the type ahead of time.* 

In our own words, generic types allow us to write code that *generalizes* over many possible types. In fact, that is where they get there name from. 

## Type parameters and type arguments
In Motoko, [custom types](/common-programming-concepts/types.html#the-type-keyword), [functions](/common-programming-concepts/functions.html) and [classes](/common-programming-concepts/objects-and-classes/classes.html) can specify *generic type parameters*. Type parameters have *names* and are supplied by adding them in between angle brackets `< >`. The angle brackets are supplied directly after the *name* of the type, function or class.  

### Type parameters
Here's a custom type alias for a [tuple](/common-programming-concepts/types/tuples.html), that has the *conventional* generic type parameter `T`:
```motoko
{{#include _mo/type-args.mo:a}}
```

The type parameter `T` is supplied after the custom type name in angle brackets: `CustomType<T>`. Then the generic type parameter is used inside the tuple. This indicates that a value of `CustomType` will have *some* type `T` in the tuple (alongside known types `Nat` and `Int`) without knowing ahead of time what type that would be.

The names of generic type parameters are by convention single capital letters like `T` and `U` or words that start with a capital letter like `Ok` and `Err`. 

Generic parameter type names must start with a letter, may contain lowercase and uppercase letters, and may also contain numbers `0-9` and underscores `_`.

### Type arguments
Lets use our `CustomType`:
```motoko
{{#include _mo/type-args.mo:b}}
```

The `CustomType` is used to [annotate](/common-programming-concepts/types.html) our variable `x`. When we actually *construct* a value of a generic type, we have to specify a specific type for `T` as a *type argument*. In the example, we used `Bool` as a type argument. Then we wrote a tuple of values, and used a `true` value where a value of type `T` was expected.

The same `CustomType` could be used again and again with different type arguments for `T`:
```motoko
{{#include _mo/type-args.mo:c}}
```

In the last example we used `[Nat]` as a type argument. This means we have to supply an [immutable array](/common-programming-concepts/types/immutable-arrays.html) of type `[Nat]` for the `T` in the tuple. 

## Generics in type declarations
A commonly used generic type is the `Result` [variant type](/common-programming-concepts/types/variants.html) that is available as a [public type](/common-programming-concepts/modules.html#public-types-in-modules) in the [Base Library](/base-library.html) in the [Result module](/base-library/utils/result.html). 
```motoko
{{#include _mo/generics.mo:a}}
```

A type alias `Result` is declared, which has two type parameters `Ok` and `Err`. The type alias is used to refer to a variant type with two variants `#ok` and `#err`. The variants have *associated types* attached to them. The associated types are of generic type `Ok` and `Err`.

This means that the variants can take on many different associated types, depending on how we want to use our `Result`. 

Results are usually used as a return value for functions to provide information about a possible *success* or *failure* of the function:
```motoko
{{#include _mo/generics.mo:b}}
```

Our function `checkUsername` takes a `Text` argument and returns a value of type `Result<(), Text>`. The unit type `()` and `Text` are *type arguments*. 

The function checks the size of the its argument `name`. In case `name` is shorter than 4 characters, it returns an 'error' by constructing a *value* for the `#err` variant and adding an associated value of type `Text`. The return value would in this case be `#err("Too short!")` which is a valid value for our `Result` variant. 

Another failure scenario is when the argument is longer than 20 characters. The function returns `#err("To long!")`.

Finally, if the size of the argument is allowed, the function indicates success by constructing a value for the `#ok` variant. The associated value is of type `()` giving us `#ok()`.

If we use this function, we could [`switch`](/common-programming-concepts/control-flow/switch-expression.html) on its return value like this:
```motoko
{{#include _mo/generics.mo:c}}
```

We [pattern match](/common-programming-concepts/pattern-matching.html) on the possible variants of `Result<(), Text>`. In case of the `#err` variant, we also *bind* the associated `Text` value to a new name `error` so we could use it inside the scope of the `#err` case. 


## Generics in functions
Generic types are also found in functions. Functions that allow type parameters are:  
- Private and public functions in [modules](/common-programming-concepts/modules.html) and [nested modules](/common-programming-concepts/modules.html#nested-modules)
- Private and public functions in [objects](/common-programming-concepts/objects-and-classes/objects.html)
- Private and public functions in [classes](/common-programming-concepts/objects-and-classes/classes.html)
- **Only private functions** in [actors](/internet-computer-programming-concepts/actors.html)

> **NOTE**  
> *[Public shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) in actors are **not allowed** to have generic type arguments.* 

Some [public functions in modules](/common-programming-concepts/modules.html#public-functions-in-modules) of the [Base Library](/base-library.html) are written with generic type parameters. Lets look the useful `init` public function found in the `Array` module of the Base Library:
```motoko
public func init<X>(size : Nat, initValue : X) : [var X]
// Function body is omitted
```

This function is used to construct a [mutable array](/common-programming-concepts/types/mutable-arrays.html) of a certain `size` filled with copies of *some* `initValue`. The function takes one generic type parameter `X`. This parameter is used to specify the type of the initial value `initValue`.

It may be used like this:
```motoko
{{#include _mo/generic-functions.mo:a}}
```

We import the `Array.mo` module and name it `Array`. We access the function with `Array.init`. We supply *type arguments* into the angle brackets, in our case `<Bool>`. The second argument in the function (`initValue`) is now of type `Bool`. 

A mutable array will be constructed with `3` mutable elements of value `true`. The value of `t` would therefore be
```motoko
{{#include _mo/generic-functions.mo:b}}
```

## Generics in classes