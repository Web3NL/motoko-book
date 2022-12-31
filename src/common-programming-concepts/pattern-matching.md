# Pattern Matching

When we discussed tuples, objects and variants, we were building up *structured data* types. With pattern matching we are able to *decompose* structured data into its constituent parts. 

Lets use pattern matching to decompose a tuple into its constituent parts. We first construct a tuple and assign it to a variable. Then we deconstruct it by naming its values one by one and bringing them into scope:

```motoko
let individual = ("Male", 30);

let (gender, age) = individual;
```

The tuple `("Male", 30)` has a `Male` value and a `30` value. The second line *binds* these values to newly created variable names `gender` and `age`. We can nou use these variables in this scope. 

We could also type annotate the variable names to *check* the type of the values we are decomposing. 

```motoko
let (gender : Text, _ : Nat) = individual;
```

In this last example, we only brought gender into scope. Using the *wildcard* `_` indicates that we don't care about the second value which should have type `Nat`.

When we decompose `individual` into `gender` and `age` we say that the variable is *consumed* by the pattern `(gender, age)`.

Lets look at an example of pattern matching on an object:

```motoko
let person = {
    name = "Peter";
    member = false;
};

let {name; member} = person;
```

In the example above, we define an object. We then decompose the object fields by using the names of the fields, thereby bringing these variables into scope. 

Note we use the `{name; member}` pattern to consume the variable.

We don't have to use all the fields. We could use only one for example:

```motoko
let {name} = person;
```

We could also rename the fields:

```motoko
let {name = realName; member = groupMember} = person;
```

Type annotation within the patterns is allowed and recommended when its not obvious what the type should be. 

Pattern matching is a powerful feature of Motoko with many more options and we will revisit it later in this book. For more info check the [official docs](https://internetcomputer.org/docs/current/developer-docs/build/cdks/motoko-dfinity/pattern-matching).

*Source file: [pattern-matching.mo](pattern-matching.mo)*