# While

A `while` loop allows code to be executed repeatedly while a certain condition is true.

In Motoko, the `while` loop is constructed with the `while` keyword followed by a Boolean condition enclosed in parenthesis `()` and a code block enclosed in curly braces `{}`. The code block contains the statements that will be executed repeatedly while the condition is true.

```motoko
{{#include _mo/while.mo:a}}
```

In the example above, we declared a mutable variable called `count` and set it to zero. We then defined a `while` loop that checks whether `count` is less than `5`. While this condition is true, the code block inside the `while` loop will be executed, which increments the value of `count` by `1`. This continues until the condition is no longer true.

If the condition is false from the beginning, then the code block inside the loop is never executed.
`maxCount = 0 -> count = 0`
`maxCount = 5 -> count = 5`

## Loop-While
In some cases we might want to check the condition after the first code block execution. We can do this by putting a `loop` with the code block before the `while` expression. 

```motoko
{{#include _mo/while.mo:b}}
``` 

This will result in the code being executed alteast once.
`maxCount = 0 -> count = 1`
`maxCount = 5 -> count = 5`

