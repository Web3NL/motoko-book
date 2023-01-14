# If Else Expression
The `if else` expression starts with an `if` expression followed by the `else` keyword and a third expression also enclosed in curly braces `{}`. When the first expression now evaluates to `false`, the third expression evaluates in stead of returning `()`. 

It looks like this:

```motoko
if (condition) {} else {};
```

To demonstrate that the *whole* `if else` expression evaluates to a value of a certain type, we assign that value to a variable named `result`:

```motoko
let result : Text = if (condition) {
    "condition was true"
} else {
    "condition was false"
}
```

The second and third expression of the `if else` expression (enclosed in curly braces `{}`) must evaluate to a value of the same type. In this case its the `Text` type and therefore the variable `result` has type `Text`. 