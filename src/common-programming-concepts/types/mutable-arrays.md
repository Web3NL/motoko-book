# Mutable Arrays
Mutable arrays are a sequence of ordered *mutable* values of a certain type. To define a mutable array, we use the `var` keyword *inside* the array. 

```motoko
{{#include _mo/mutable-arrays1.mo:a}}
```

We declared an *immutable variable* named `letters` and assigned an array value to it. Our array has the keyword `var` inside of it after the first bracket to indicate that the values are mutable. The `var` keyword is used only once at the beginning. 

Notice, that array indexing works the same as for a immutable array. 

We could be more explicit about the type of our variable by annotating it:

```motoko
{{#include _mo/mutable-arrays2.mo:a}}
```

Our mutable array is of type `[var Text]`. We could now mutate the values inside the array, as long as we assign new values of type `Text`.

```motoko
{{#include _mo/mutable-arrays2.mo:b}}
```

We can mutate values as many times as we like. Lets change the last value of our array:

```motoko
{{#include _mo/mutable-arrays2.mo:c}}
```

We used the `.size()` method to obtain a `Nat` and used that to index into the array, thereby accessing the last element of the array and giving it a new `Text` value. 

Our array has now the following value:

```motoko
{{#include _mo/mutable-arrays2.mo:d}}
```

## Mutable arrays and mutable variables
We could also assign a mutable array to a mutable variable. 

```motoko
{{#include _mo/mutable-arrays3.mo:a}}
```

We declared a mutable variable named `numbers`. We annotated the type of the variable with `[var Nat]` indicating that the value of this variable is a mutable array of `Nat` values. We then assigned a mutable array to the variable name. Not, that the array has the keyword `var` inside of it.

In the second line we access the third element by indexing and mutate the `Nat` value at that index.

In the third line, we mutate the value of the variable, which is a whole new mutable array with one single value.

In the last line, we mutate the value of the variable again, which is a whole new mutable array with zero values.

We could mutate the variable again, but the new value has to be of type `[var Nat]`