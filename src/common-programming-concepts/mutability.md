# Mutability

Variables that can change their value *after* declaring them are called *mutable variables*. They are declared using a `var` declaration:

```motoko
{{#include _mo/mutability.mo:a}}
```

`x` is now the name of a mutable variable with the value `1`. If we want change the value, in other words *mutate* it, we *assign* a new value to it:

```motoko
{{#include _mo/mutability.mo:b}}
```

`x` now has the value `2`. 

The `:=` is called the assignment [operator](operators.html). It is used to assign a new value to an already declared variable. 

We can change the value of a mutable variable as many times as we like. For example, we declare a mutable variable named `city` with text value `"Amsterdam"`

```motoko
{{#include _mo/mutability.mo:c}}
```

And we also declare two immutable variables. 

```motoko
{{#include _mo/mutability.mo:d}}
```

Now we mutate `city` three times:

```motoko
{{#include _mo/mutability.mo:e}}
```

The last mutation was achieved by assigning a *string literal* to the variable name. The first two mutations were achieved by assigning the value of other immutable variables. It is also possible to assign the value of another mutable variable. 

