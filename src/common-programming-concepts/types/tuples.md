# Tuples

A tuple type is an ordered sequence of possibly different types enclosed in parenthesis:

```motoko
type MyTuple = (Nat, Text);
```

Here is a variable with the `MyTuple` type.

```motoko
let myTuple: MyTuple = (2, "motoko");
```

We can _access_ the values of the tuple like this:

```motoko
let motoko = myTuple.1;
```

By adding `.1` to `myTuple` we access the second element of the tuple. This is called _tuple projection_. The indexing starts at 0.

Another example:

```motoko
let profile : (Text, Nat, Bool) = ("Anon", 100, true);
```

A tuple type is created and used without using an alias. The variable name `profile` is annotated with the tuple type. The value assigned to the variable is a tuple of values `("Anon", 100, true)`;

We access the first element like this:

```motoko
let username: Text = profile.0;
```
