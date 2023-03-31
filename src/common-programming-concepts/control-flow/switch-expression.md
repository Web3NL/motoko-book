# Switch Expression
The `switch` expression is a powerful control flow construct that allows [pattern matching](/common-programming-concepts/pattern-matching.html) on its input. 

It is constructed with the `switch` keyword followed by an input expression enclosed in parenthesis `()` and a code block enclosed in curly braces `{}`. Inside this code block we encounter the `case` keyword once or several times depending on the input. 

```motoko
{{#include _mo/switch.mo:a}}
```

The `case` keyword is followed by a *[pattern](/common-programming-concepts/pattern-matching.html)* and an expression in curly braces `{}`. Pattern matching is performed on the input and the possible values of the input are *bound* to the names in the pattern. If the pattern matches, then the expression in the curly braces evaluates. 

Lets switch on a variant as an input:

```motoko
{{#include _mo/switch.mo:b}}
```

We defined a variant type `Color`, declared a variable `color` with that type and declared another mutable variable `count` and set it to zero. We then used our variable `color` as the input to our `switch` expression.

After every `case` keyword, we check for a possible value of our variant. When we have a match, we execute the code in the expression defined for that case.

In the example above, the color is `#Black` so the `count` variable will be incremented by one. The other cases will be skipped. 

If all expressions after every `case (pattern)` evaluate to a value of the same type, then like in the example of the `if else` expression, we could assign the return value of the *whole* `switch` expression to a variable or use it anywhere else an expression is expected.

In the example above, our `switch` expression evaluates to `()`.

## A little program

Lets combine some concepts we have learned so far. We will use a `Result`, an `Option`, a mutable variable, a `function` and a `switch` expression together:

```motoko
{{#include _mo/switch.mo:c}}
```

We started by defining a `Result` type with two variants `#ok` and `#err`. Each variant has an associated type namely `Nat` and `Text`. 

Then we define an `Option` type called `Balance`. It is an optional value of type `?Nat`.

We then declare a mutable variable called `balance` and annotate it with the `Balance` type.

And lastly, we define a function that takes one argument of type `?Nat` and returns a value of type `Result`. The function uses a `switch` expression to check the value of our variable `balance`.

The `switch` expression checks two cases: 
- In the case the value of `balance` is `null`, it returns the `#err` variant with an associated text. This is returned to the function body, which is then treated as the return value of the function. 
- In the case the value of `balance` is some optional value `?amount`, it returns the `#ok` variant with an associated value `amount`.

In both cases we used *pattern matching* to check the values. In the last case we defined a new name `amount` to *bind* our value, in case we found some optional value of type `?Nat`. If so, then that value is now available through this new name. 

Lets now call this function.


```motoko
{{#include _mo/switch.mo:d}}
```

The first call will yield `#err "No balance!"` telling us that the balance is `null`. We then mutate the value of our balance to a new optional value `?10`. When we call the function again, we get `#ok 10`. 

Note, we didn't have to annotate the `amount` variable with the `Result` type, but it does make it more clear to the reader what the expected type is of the function. 
