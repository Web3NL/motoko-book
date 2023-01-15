# Immutable Arrays
Arrays in Motoko are like an ordered sequences of values of a certain type. An immutable array is an ordered sequence of values that can't change after they are declared. 

Here's a simple array:

```motoko
{{#include _mo/immutable-arrays1.mo:a}}
```

We assigned an array value to our variable `letters`. The array consists of values of a certain type enclosed in angle brackets `[]`. The values inside the array have to be of the same type. And the whole array also has an *array type*.

```motoko
{{#include _mo/immutable-arrays2.mo:a}}
```

We declare an array type `[Text]` and named it `Letters`. This type indicates an array with zero or more values of type `Text`. We did not have to declare the type up front. We could use the array type to annotate any variable:

```motoko
{{#include _mo/immutable-arrays3.mo:a}}
```

We used the type `[Text]` to annotate our variable. The array values now have to be of type `Text`. 

We can access the values inside the array by *indexing* the variable. This is sometimes called *array projection*:

```motoko
{{#include _mo/immutable-arrays3.mo:b}}
```

Indexing the variable `letters` by adding `[0]` allows us to access the first element in the array. In the example above, the variable `a` now has text value `"a"` which is of type `Text`.

But we have to take care when we try to access values inside an array. If we choose an index that does not exist in our array, the program wil stop executing with an error!

```motoko
{{#include _mo/immutable-arrays3.mo:c}}
```

To avoid indexing into array outside its bounds, we could use a *method* that is available on all array types called `size()`. A method is just a [function](/common-programming-concepts/functions.html) that is called on a named value. 

```motoko
{{#include _mo/immutable-arrays3.mo:d}}
```

We now declared a variable named `size` which is of type `Nat` and assign the value returned by our method `.size()`. This method returns the total length of the array. In our case, this value would be `3`. 

## Arrays and mutable variables
An immutable array could be assigned to a mutable variable. The array values are still immutable, but the value of the variable (which is an immutable array) could change.

```motoko
{{#include _mo/immutable-arrays3.mo:e}}
```

We declare a mutable variable `numbers` of type `[Nat]` and assign an array of `Nat` values to it. We could not change any of the values if we wanted, but we could assign a whole new array to the variable. 

In the second line, we assigned another value of type `[Nat]` to our variable `numbers`. The variable `numbers` could be mutated many times as long as it's assigned value is of type `[Nat]`.