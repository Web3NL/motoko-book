# Mutability

Variables that can change their value *after* declaring them are called *mutable variables*. They are declared using a `var` declaration:

```motoko
var x = 1;
```

`x` is now the name of a mutable variable with the value `1`. If we want change the value, in other words *mutate* it, we *assign* a new value to it:

```motoko
x := 2;
```

`x` now has the value `2`. 

The `:=` is called the assignment operator. It is used to assign a new value to an already declared variable. 

We can change the value of a mutable variable as many times as we like. For example, we declare a mutable variable named `city` with text value `"Amsterdam"`

```motoko
var city = "Amsterdam";
```

And we also declare two immutable variables. 

```motoko
let newYork = "New York";
let berlin = "Berlin";
```

Now we mutate `city` three times:

```motoko
city := newYork;
city := berlin;
city := "Paris";
```

The last mutation was achieved by assigning a *string literal* to the variable name. The first two mutations were achieved by assigning the value of other immutable variables. It is also possible to assign the value of another mutable variable. 

*Source file: [mutability.mo](mutability.mo)*