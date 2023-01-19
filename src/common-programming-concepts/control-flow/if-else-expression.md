# If Else Expression
The `if else` expression starts with an `if` expression (including two sub-expressions, a condition and its associated branch) followed by the `else` keyword and a third sub-expression:

```motoko
if (condition) 1 else 2;
```

When the branches are more complex expressions, they require curly braces:

```motoko
if (condition) {if-branch} else {else-branch};
```

Unlike `if` expressions that lack an `else`, when the first sub-expression of an `if else` evaluates to `false`, the entire `if else` expression evaluates as the third sub-expression, not the unit value `()`. 

For example, this `if else` expression evaluates to a value of a certain type (`Text`), and we assign that value to a variable named `result`:

```motoko
let result : Text = if (condition) {
    "condition was true"
} else {
    "condition was false"
}
```

Generally, the second and third sub-expressions of the `if else` expression must evaluate to a value of the same type, as they do here (again, the common type is ``Text`).
