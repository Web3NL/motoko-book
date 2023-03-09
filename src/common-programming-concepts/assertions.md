# Assertions
Sometimes it is convenient to make sure some condition is *true* in your program before continuing execution. For that we can use an *assertion*. 

An assertion is made using the `assert` keyword. It always acts on an expression of type `Bool`. 

If the expression is `true` then the whole assertion evaluates to the unit type `()` and the program continues execution as normal. If the expression evaluates to `false` then the program *traps*. 

```motoko
{{#include _mo/assertions.mo:a}}
```

Because our `condition` is `false`, this program will trap at the assertion. The exact consequences of a trap inside a running canister will be explained [later in this book](/advanced-concepts.html). 
