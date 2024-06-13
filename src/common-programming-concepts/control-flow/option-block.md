# Do Option Block

A _do option_ block is written by adding a question mark `?` after the `do` keyword. The result of the do block will now have an optional null value, this value is achieved by having _atleast_ one imperative null break within this block by using an exclamation mark `!` with or without a space in between. If the associated expression is null then it will abort the do block and result in a null value.

Let's introduce an unknown variable of type ?Nat called `z` .

```motoko
{{#include _mo/option-block.mo:a}}
```

These null breaks can also be used as the result of more complex expressions or statements inside the option block, often used as a way to check for certain conditions.

In this example we add an if statement to prevent `z` from being of value 0, forcing the input to be atleast a positive natural number.

```motoko
{{#include _mo/option-block.mo:b}}
```

Beware of the exclamation marks after the `null` result , this is still needed here to be able to abort the do block. 

In practice we would often use functions to check and call our data within the do block to maintain code readability. So let's extract the if statement as a function. 

The null break `!` can be used in the beginning of  the `z` declaration during the function call, resulting in the block to be aborted _without_ further execution. 

```motoko
{{#include _mo/option-block.mo:c}}
```
Or the null break `!` is put in a later stage or last expression, allowing the previous lines of code to be executed _before_ the null break aborts the block.

```motoko
{{#include _mo/option-block.mo:d}}
```

## Side Effects

If we use the `ignore` keyword and combine all of our actions using the `do ?` , we can stop the whole block of actions as soon as any one of them fails (returns null). This means we don't waste time running any more failed actions, and we can move on to other parts of our program.

Whatever happens inside this block of actions, the final value that it returns will be ignored. This allows our program to continue running without being affected by the outcome of these actions.

This is for example useful for testing certain code or other specific _side effects_.

```motoko
{{#include _mo/option-block.mo:e}}
```
This evaluates to _nothing_ as any return value is ignored
But as a side effect, there might be a console output if the block's expressions did not fail.
