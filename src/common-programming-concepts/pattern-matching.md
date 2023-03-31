# Pattern Matching

When we discussed [tuples](/common-programming-concepts/types/tuples.html), [records](/common-programming-concepts/types/records.html) and [variants](/common-programming-concepts/types/variants.html), we were building up _structured data_ types. With pattern matching we are able to _decompose_ structured data into its constituent parts.

Lets use pattern matching to decompose a tuple into its constituent parts. We first construct a tuple and assign it to a variable. Then we deconstruct it by naming its values one by one and bringing them into scope:

```motoko
{{#include _mo/pattern-matching.mo:a}}
```

The tuple `("Male", 30)` has a `"Male"` value and a `30` value. The second line _binds_ these values to _newly created_ variable names `gender` and `age`. We can now use these variables in this scope.

We could also type annotate the variable names to _check_ the type of the values we are decomposing.

```motoko
{{#include _mo/pattern-matching1.mo:a}}
```

In this last example, we only brought gender into scope. Using the _wildcard_ `_` indicates that we don't care about the second value which should have type `Nat`.

When we decompose `individual` into `gender` and `age` we say that the variable is _consumed_ by the pattern `(gender, age)`.

Lets look at an example of pattern matching on a record:

```motoko
{{#include _mo/pattern-matching.mo:b}}
```

In the example above, we define a record. We then decompose the record fields by using the names of the fields, thereby bringing these variables into scope.

Note we use the `{name; member}` pattern to consume the variable.

We don't have to use all the fields. We could use only one for example:

```motoko
{{#include _mo/pattern-matching2.mo:a}}
```

We could also rename the fields:

```motoko
{{#include _mo/pattern-matching.mo:c}}
```

Type annotation within the patterns is allowed and recommended when its not obvious what the type should be.

Pattern matching is a powerful feature of Motoko with many more options and we will revisit it later in this book. For more info check the [official docs](https://internetcomputer.org/docs/current/developer-docs/build/cdks/motoko-dfinity/pattern-matching).
