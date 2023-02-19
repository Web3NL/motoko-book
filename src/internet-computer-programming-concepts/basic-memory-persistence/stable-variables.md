# Stable Variables
To persist the state of an actor when [upgrading](/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html), we can declare [immutable](/common-programming-concepts/variables.html) and [mutable](/common-programming-concepts/mutability.html) variables to be `stable`. Stable variables must be of [*stable type*](/internet-computer-programming-concepts/basic-memory-persistence/stable-variables.html#stable-types).

## Mutating and Upgrading Stable Mutable Variables
The [*mutable state of an actor*](/internet-computer-programming-concepts/actors.html#a-simple-actor) is stored in the form of mutable variables that are declared with the `var` keyword. Mutable variables in actors always have `private` *visibility*. (although the `private` keyword is not necessary and is assumed by default).

If we want to persist the state of our actor when [upgrading](/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html), we could declare our mutable variables `stable`, if it is of [stable type](/internet-computer-programming-concepts/basic-memory-persistence/stable-variables.html#stable-types). A stable variable looks like this:
```motoko
{{#include _mo/stable-variables.mo:a}}
```

This variable now *persists* its state even after *upgrading* the actor code. Lets demonstrate this with an actor that implements a simple counter.
```motoko
{{#include _mo/stable-variables2.mo:a}}
```

Our actor has a mutable variable `count` that is declared `stable`. It's initial value is `0`. We also have a [query](/internet-computer-programming-concepts/actors.html#public-shared-query) function `read` and an [update](/internet-computer-programming-concepts/actors.html#public-shared-update) function `increment`. The value of `count` is shown below in a *timeline of state* in two instances of our counter actor: one with `var count` and the other with `stable var count`:

|Time|Event|Value of <br> `var count`|Value of <br> `stable var count`|
|---|---|---|---|
|1|First install of actor code|<center>0</center>|<center>0</center>|
|2|Call `increment()`|<center>1</center>|<center>1</center>|
|3|Call `read()`|<center>1</center>|<center>1</center>|
|4|Call `increment()`|<center>2</center>|<center>2</center>|
|5|[Upgrade](/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html) actor code|<center>0</center>|<center>2</center>|
|6|Call `read()`|<center>0</center>|<center>2</center>|
|7|Call `increment()`|<center>1</center>|<center>3</center>|
|8|Call `increment()`|<center>2</center>|<center>4</center>|
|9|[Reinstall](/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html) actor code|<center>0</center>|<center>0</center>|
|10|Call `read()`|<center>0</center>|<center>0</center>|
|11|Call `increment()`|<center>1</center>|<center>1</center>|
|12|Call `increment()`|<center>2</center>|<center>2</center>|

**Time 1:** Our initial value for `count` is 0 in both cases.  
**Time 2:** An update function mutates the state in both cases.  
**Time 3:** A query function does not mutate state in both cases.  
**Time 5:** `stable var count` value is persisted after [upgrade](/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html).  
**Time 6:** `var count` is reset after upgrade.  
**Time 7:** `var count` starts at `0`, while `stable var count` starts at `2`.  
**Time 10:** `var count` and `stable var count` are both reset due to [reinstall](/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html). 

## Stable types
A type is *stable* if it is [shared](/internet-computer-programming-concepts/async-data/shared-types.html) and remains shared after ignoring any `var` keywords within it. An [object](/common-programming-concepts/objects-and-classes/objects.html) with private functions is also stable. Stable types thus include all [shared types](/internet-computer-programming-concepts/async-data/shared-types.html) plus some extra types that contain [mutable variables](/common-programming-concepts/mutability.html) and object types with private functions. 

Stable variables can only be declared inside [actors](/internet-computer-programming-concepts/actors.html). Stable variables always have `private` *visibility*. 

The following *types* for *[immutable](common-programming-concepts/variables.html) or [mutable](/common-programming-concepts/mutability.html)* variables in actors (in addition to all [shared types](/internet-computer-programming-concepts/async-data/shared-types.html)) could be declared stable.

### Stable Mutable Array
Immutable or mutable variables of [*mutable array type*](/common-programming-concepts/types/mutable-arrays.html) could be declared stable:
```motoko
{{#include _mo/stable-var1.mo:a}}
```

*Immutable variable* `a1` can be stable because `[var Nat]` is a mutable array type. *Mutable variable* `a2` can be stable because `[var Text]` is of mutable array type.   

### Stable Records with Mutable Fields
Immutable or mutable variables of [*records with mutable fields*](/common-programming-concepts/types/records.html) could be declared stable:
```motoko
{{#include _mo/stable-var1.mo:b}}
```

*Immutable variable* `r1` and *mutable variable* `r2` can be stable because they have a value of a *record with a mutable field*. 

### Stable Objects with Mutable Variables
Immutable or mutable variables of [*objects with (private or public) mutable variables*](/common-programming-concepts/objects-and-classes/objects.html) could be declared stable:
```motoko
{{#include _mo/stable-var1.mo:c}}
```

*Immutable variable* `o1` and *mutable variable* `o2` can be stable because they have a value of an *object with private and public mutable variables*. 

### Stable Objects with Private Functions
Immutable or mutable variables of [*objects with private functions*](/common-programming-concepts/objects-and-classes/objects.html) could be declared stable:
```motoko
{{#include _mo/stable-var1.mo:d}}
```

*Immutable variable* `p1` and *mutable variable* `p2` can be stable because they have a value of an *object with a private function*. 

### Other stable types
On top all [shared types](/internet-computer-programming-concepts/async-data/shared-types.html) and the types mentioned above, the following types could also be stable:  
- [Tuples](/common-programming-concepts/types/tuples.html) of stable types 
- [Option](/common-programming-concepts/options-and-results.html) types of any stable types
- [Variant](/common-programming-concepts/types/variants.html) types with associated types that are stable

## How it works
Declaring variable(s) `stable` causes the following to happen *automatically* when [upgrading](/internet-computer-programming-concepts/basic-memory-persistence/upgrades.html) our canister with new actor code:
- The value of the variable(s) is *serialized* into [Candid format](/internet-computer-programming-concepts/async-data/candid.html#candid-serialization).
- The serialized Candid format is copied to [stable memory](/advanced-concepts/scalability/stable-storage.html).  
- The upgraded actor code (in the form of a [Wasm module](/internet-computer-programming-concepts/actors/actor-to-canister.html#code-compiling-and-wasm-modules)) is installed in the [canister](/internet-computer-programming-concepts/actors/actor-to-canister.html) and the state of the variables is lost.
- The values in Candid format inside stable memory are retrieved and [*deserialized*](/internet-computer-programming-concepts/async-data/candid.html#candid-serialization).
- The variables of the new actor code are assigned the original deserialized values.   

