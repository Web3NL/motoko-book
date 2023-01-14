# Records

Records are like a *collection* of named values (variables). These values could be mutable or immutable. We assign a record to a variable name `peter`:

```motoko
let peter = {
    name = "Peter";
    age = 18;
};
```

The record is enclosed with curly brackets `{}`. The example above is a named record with two *field expressions*. A field expression consists of a variable name and its assigned value. In this case `name` and `age` are the names. `Peter` and `18` are the values. Field expressions end with a semicolon `;`

We could annotate the types of the variables like this:

```motoko
let peter = {
    name : Text = "Peter";
    age : Nat = 18;
};
```

The record now has two type annotated fields. The whole record also has a [type](#object-literal). We could write:

```motoko
type Person = {
    name : Text;
    age : Nat;
};
```

This type declaration defines a new name for our type and specifies the type of the record. We could now start using this type to declare several variables of this same type:

```motoko
let bob : Person = {
    name = "Bob";
    age = 20;
};

let alice : Person = {
    name = "Alice";
    age = 25;
};  
```

Another example is a record with mutable contents:

```motoko
type Car = {
    brand : Text;
    var mileage : Nat;
};

let car : Car = {
    brand = "Tesla";
    var mileage = 20_000;
};

car.mileage := 30_000;
```

We defined a new type `Car`. It has a mutable field `var mileage`. This field can be accessed by writing `car.mileage`. We then mutated the value of the mutable `mileage` variable to the value 30_000; 

Note, we used an underscore `_` in the natural number. This is allowed for readability and does not affect the value.

## Object literal

Records are sometimes referred to as *[object](/common-programming-concepts/objects-and-classes.html) literals*. They are like the string literals we saw in earlier chapters. Records are a 'literal' value of an object. We will discuss [objects](/common-programming-concepts/objects-and-classes.html) and their types in an upcoming chapter.

In our examples above, the literal value for the `bob` variable was:

```motoko
{
    name = "Bob";
    age = 20;
}
```

And this record has an *object type*:

```motoko
{
    name : Text;
    age : Nat;
}
```

Zero or more annotated names enclosed in `{}` is an object type. In fact, we could use this type to annotate a variable:

```motoko
let bob : { name : Text; age : Nat; } = { name = "Bob"; age = 20; };
```

This is the same declaration we made earlier, but now we spelled out the type explicitly. 

We will revisit this subject in [objects and classes](/common-programming-concepts/objects-and-classes.html).

