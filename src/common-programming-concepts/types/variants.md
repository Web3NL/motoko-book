# Variants

A variant is a type that can take on *one* of a fixed set of values. We define it as a set of values, for example:

```motoko
type MyVariant = {
    #Black;
    #White;
};
```

The variant type above has two variants: `#Black` and `#White`. When we use this type, we have to choose one of the variants. Lets declare a variable of this type and assign the `#Black` variant value to it. 

```motoko
let myVariant : MyVariant = #Black;
```

Variants can also have an associated type attached to them. Here's an example of variants associated with the `Nat` type.

```motoko
type Person = {
    #Male : Nat;
    #Female : Nat;
};

let me : Person = #Male 34;

let her : Person = #Female(29);
```

Note the two equivalent ways of using a variant value. The `#Male 34` defines the `Nat` value separated by the variant with a space. The `#Female(29)` uses `()` without a space. Both are the same. 

Variants can have different types associated to them or no type at all. For example we could have an `OsConfig` variant type that in certain cases specifies an OS version.

```motoko
type OsConfig = {
    #Mac;
    #Windows : Nat;
    #Linux : Text;
};

let linux = #Linux "Ubuntu";
```

In the case of the `#Linux` variant, the associated type is a `Text` value to indicate the Linux Distribution. In case of `#Windows` we use a `Nat` to indicate the Windows Version. And in case of `#Mac` we don't specify any version at all.

Note that the last variable declaration is not type annotated. That's fine, because Motoko will infer the type that we declared earlier. 

