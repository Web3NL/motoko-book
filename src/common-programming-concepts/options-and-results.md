# Options and Results
In this chapter we discuss the *Option* type and the *Result* variant type. 

They are different concepts but they are generally used for the same purpose, namely specifying the return type of functions. Options are used more widely beyond function return types, where as Results mostly appear as function return type. 

## Options
An option type is a type that can either have some value or have no value at all.

An option type is a *type* preceded by a question mark `?`.  
An option value is a *value* preceded by a question mark `?`.

Some examples:

```motoko
let a : ?Nat = ?202;
let b : ?Text = ?"DeFi";
let c : ?Bool = ?true;
```

Variable `a` is annotated with option type `?Nat` and assigned the option value `?202`. The option value must be of the same type as the option type, meaning the value `202` is of type `Nat`. 

Every *option value* can have the value `null`, which is a special 'value' indicating the absence of a value. The `null` value has type `Null`. For example:

```motoko
let x : ?Nat = null;
let y : ?Text = null : Null;
```

We assign the value `null` to variable `x` which has option type `?Nat`. In the second line we type annotated the `null` value with its `Null` type. 

Lets use an option type as the return type of two functions:

```motoko
func returnOption() : ?Nat {
    ?0
};

func returnNull() : ?Nat {
    null
};
```

The two functions both have `?Nat` as their return type. The first returns an option value and the second returns `null`. 

In the next chapter about [control flow](control-flow.html) we will demonstrate how we can use option types in a useful way. 

## Results
To fully understand Results we have to understand [generics](/advanced-concepts/generics.html) first, which are an advanced topic that we will cover later in this book. For now we will only cover a limited form of the Result variant type (without type parameters) to give a basic idea of the concept.

A Result type is a *[variant type](/common-programming-concepts/types/variants.html)*. A simple definition could be:

```motoko
type Result = {
    #ok;
    #err;
};
```

A value of this type may be one of two possible variants, namely `#ok` or `#err`. These variants are used to indicate either the successful *result* of a function or a possible error during the evaluation of a function.  

Lets use the Result type in the same way we used Options above:

```motoko
func returnOk() : Result {
    #ok
};

func returnErr() : Result {
    #err
};
```

Both functions have `Result` as their return type. The one returns the `#ok` variant and the other return the `#err` variant. 

In the next chapter about [control flow](control-flow.html) we will demonstrate how we can use the Result variant type in a useful way.

*Source file: [options-and-results.mo](options-and-results.mo)*