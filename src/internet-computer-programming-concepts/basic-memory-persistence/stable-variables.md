# Stable Variables

To persist the state of an actor when [upgrading](/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html), we can declare [immutable](/common-programming-concepts/variables.html) and [mutable](/common-programming-concepts/mutability.html) variables to be `stable`. Stable variables must be of [_stable type_](/internet-computer-programming-concepts/basic-memory-persistence/stable-variables.html#stable-types).

## Modifying and Upgrading Stable Variables

The [_state of an actor_](/internet-computer-programming-concepts/actors.html#a-simple-actor) is stored in the form of _immutable_ and _mutable_ variables that are declared with the `let` or `var` keywords. Variable declarations in actors always have `private` _visibility_ (although the `private` keyword is not necessary and is assumed by default).

If we want to retain the state of our actor when [upgrading](/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html), we need to declare all its state variables as `stable`. A variable can only be declared stable if it is of [stable type](/internet-computer-programming-concepts/basic-memory-persistence/stable-variables.html#stable-types). Many, but not all types, are stable. Mutable and immutable stable variables are declared like this:

```motoko
stable let x = 0;

stable var y = 0;
```

These variables now _retain_ their state even after _upgrading_ the actor code. Lets demonstrate this with an actor that implements a simple counter.

```motoko
{{#include _mo/stable-variables2.mo:a}}
```

Our actor has a mutable variable `count` that is declared `stable`. It's initial value is `0`. We also have a [query](/internet-computer-programming-concepts/actors.html#public-shared-query) function `read` and an [update](/internet-computer-programming-concepts/actors.html#public-shared-update) function `increment`. The value of `count` is shown below in a _timeline of state_ in two instances of our counter actor: one with `var count` and the other with `stable var count`:

| Time | Event                                                                                                  | Value of <br> `var count` | Value of <br> `stable var count` |
| ---- | ------------------------------------------------------------------------------------------------------ | ------------------------- | -------------------------------- |
| 1    | First install of actor code                                                                            | <center>0</center>        | <center>0</center>               |
| 2    | Call `increment()`                                                                                     | <center>1</center>        | <center>1</center>               |
| 3    | Call `read()`                                                                                          | <center>1</center>        | <center>1</center>               |
| 4    | Call `increment()`                                                                                     | <center>2</center>        | <center>2</center>               |
| 5    | [Upgrade](/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html) actor code   | <center>0</center>        | <center>2</center>               |
| 6    | Call `read()`                                                                                          | <center>0</center>        | <center>2</center>               |
| 7    | Call `increment()`                                                                                     | <center>1</center>        | <center>3</center>               |
| 8    | Call `increment()`                                                                                     | <center>2</center>        | <center>4</center>               |
| 9    | [Reinstall](/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html) actor code | <center>0</center>        | <center>0</center>               |
| 10   | Call `read()`                                                                                          | <center>0</center>        | <center>0</center>               |
| 11   | Call `increment()`                                                                                     | <center>1</center>        | <center>1</center>               |
| 12   | Call `increment()`                                                                                     | <center>2</center>        | <center>2</center>               |

**Time 1:** Our initial value for `count` is 0 in both cases.  
**Time 2:** An update function mutates the state in both cases.  
**Time 3:** A query function does not mutate state in both cases.  
**Time 5:** `stable var count` value is persisted after [upgrade](/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html).  
**Time 6:** `var count` is reset after upgrade.  
**Time 7:** `var count` starts at `0`, while `stable var count` starts at `2`.  
**Time 10:** `var count` and `stable var count` are both reset due to [reinstall](/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html).

## Stable types

A type is _stable_ if it is [shared](/internet-computer-programming-concepts/async-data/shared-types.html) and remains shared after ignoring any `var` keywords within it. An [object](/common-programming-concepts/objects-and-classes/objects.html) with private functions is also stable. Stable types thus include all [shared types](/internet-computer-programming-concepts/async-data/shared-types.html) plus some extra types that contain [mutable variables](/common-programming-concepts/mutability.html) and object types with private functions.

Stable variables can only be declared inside [actors](/internet-computer-programming-concepts/actors.html). Stable variables always have `private` _visibility_.

The following _types_ for _[immutable](common-programming-concepts/variables.html) or [mutable](/common-programming-concepts/mutability.html)_ variables in actors (in addition to all [shared types](/internet-computer-programming-concepts/async-data/shared-types.html)) could be declared stable.

### Stable Mutable Array

Immutable or mutable variables of [_mutable array type_](/common-programming-concepts/types/mutable-arrays.html) could be declared stable:

```motoko
stable let a1 : [var Nat] = [var 0, 1, 2];

stable var a2 : [var Text] = [var "t1", "t2", "t3"];
```

_Immutable variable_ `a1` can be stable because `[var Nat]` is a mutable array type. _Mutable variable_ `a2` can be stable because `[var Text]` is of mutable array type.

### Stable Records with Mutable Fields

Immutable or mutable variables of [_records with mutable fields_](/common-programming-concepts/types/records.html) could be declared stable:

```motoko
stable let r1 = { var x = 0 };

stable var r2 = { var x = 0; y = 1 };
```

_Immutable variable_ `r1` and _mutable variable_ `r2` can be stable because they contain a stable type, namely a _record with a mutable field_.

### Stable Objects with Mutable Variables

Immutable or mutable variables of [_objects with (private or public) mutable variables_](/common-programming-concepts/objects-and-classes/objects.html) could be declared stable:

```motoko
stable let o1 = object {
    public var x = 0;
    private var y = 0;
};

stable var o2 = object {
    public var x = 0;
    private var y = 0;
};
```

_Immutable variable_ `o1` and _mutable variable_ `o2` can be stable because they contain a stable type, namely an _object with private and public mutable variables_.

### Stable Objects with Private Functions

Immutable or mutable variables of [_objects with private functions_](/common-programming-concepts/objects-and-classes/objects.html) could be declared stable:

```motoko
stable let p1 = object { private func f() {} };

stable var p2 = object { private func f() {} };
```

_Immutable variable_ `p1` and _mutable variable_ `p2` can be stable because they contain a stable type, namely an _object with a private function_.

### Other stable types

On top all [shared types](/internet-computer-programming-concepts/async-data/shared-types.html) and the types mentioned above, the following types could also be stable:

- [Tuples](/common-programming-concepts/types/tuples.html) of stable types
- [Option](/common-programming-concepts/options-and-results.html) types of any stable types
- [Variant](/common-programming-concepts/types/variants.html) types with associated types that are stable

## How it works

Declaring variable(s) `stable` causes the following to happen _automatically_ when [upgrading](/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html) our canister with new actor code:

- The value of the variable(s) is _serialized_ into an internal data format.
- The serialized data format is copied to [stable memory](/advanced-concepts/scalability/stable-storage.html).
- The upgraded actor code (in the form of a [Wasm module](/internet-computer-programming-concepts/actors/actor-to-canister.html#code-compiling-and-wasm-modules)) is installed in the [canister](/internet-computer-programming-concepts/actors/actor-to-canister.html) and the state of the variables is lost.
- The values in data format inside stable memory are retrieved and [_deserialized_](/internet-computer-programming-concepts/async-data/candid.html#candid-serialization).
- The variables of the new actor code are assigned the original deserialized values.

## Example of non-stable type

A non-stable type could be an [object with public functions](/common-programming-concepts/objects-and-classes/objects.html#public-functions-in-objects). A variable that contains such an object, could not be declared stable!

```motoko
stable let q1 = object {
    public func f() {};
};
```

**ERROR:** _Variable q1 is declared stable but has non-stable type!_
