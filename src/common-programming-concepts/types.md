# Types

A type describes the *data type* of a value. Motoko has static types. This means that the type of every value is known when the Motoko code is being *compiled*.

Motoko can in many cases know the type of a variable without you doing anything:

```markdown
let x = true;
```

In the example above the `true` value of variable name `x` has the `Bool` type. We did not state this explicitly but Motoko *infers* this information automatically for us.

In some cases the type is not obvious and we need to add the type ourselves. This is called *type annotation*. We can annotate the name of the variable like this:

```markdown
let x : Bool = true;
```

With the colon `:` and the name of the type after the variable name, we tell Motoko that `x` is of type `Bool`.

We can also annotate the value:

```markdown
let x = true : Bool;
```

Or both:

```markdown
let x : Bool = true : Bool;
```
    
In this case it is unnecessary and makes the code ugly. The convention is to leave spaces around the colon.

*Primitive types* are fundamental core data types that are not composed of more fundamental types. Some common ones in Motoko are:  
- Nat
- Int
- Float
- Bool
- Blob
- Text
- Principal

See the [full list of all Motoko data types](https://internetcomputer.org/docs/current/developer-docs/build/cdks/motoko-dfinity/language-manual#primitive-types)
 
We can define arbitrary names for any type:

```markdown
type Age = Nat;
```   

This creates an alias (a second name) for the `Nat` type. This is useful for writing clear readable code.

```markdown
let age : Age = 18; 
```

The variable name `age` is of type `Age`. 

