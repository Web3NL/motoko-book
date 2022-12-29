# Mutability

Variables that can change their value *after* declaring them are called *mutable variables*. They are declared using a `var` declaration:

```markdown
var x = 1;
```

`x` is now the name of a mutable variable with the value `1`. If we want change the value, in other words *mutate* it, we *assign* a new value to it:

```markdown
x := 2;
```

`x` now has the value `2`. 

The `:=` is called the assignment operator. It is used to assign a new value to an already declared variable. 

We can change the value of a mutable variable as many times as we like.  