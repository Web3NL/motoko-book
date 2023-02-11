# Stable Variables
The *state* of an actor is stored in the form of mutable variables that are declared with the `var` keyword. Mutable variables are restricted to [*shared types*](/internet-computer-programming-concepts/async-data/shared-types.html) only and always have `private` *visibility*. (although the `private` keyword is not necessary and is assumed by default).

If we want to persist the state of our actor when [upgrading](/internet-computer-programming-concepts/basic-memory-persistence/simple-upgrades.html), we could declare our mutable variables `stable`. A stable variable looks like this:
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
|5|Reinstall same actor code|<center>0</center>|<center>2</center>|
|6|Call `read()`|<center>0</center>|<center>2</center>|
|7|Call `increment()`|<center>1</center>|<center>3</center>|
|8|Call `increment()`|<center>2</center>|<center>4</center>|
|9|Reinstall again|<center>0</center>|<center>4</center>|
|10|Call `read()`|<center>0</center>|<center>4</center>|
|11|Call `increment()`|<center>1</center>|<center>5</center>|
|12|Call `increment()`|<center>2</center>|<center>6</center>|

**Time 1:** Our initial value for `count` is 0 in both cases.  
**Time 2:** An update function mutates the state in both cases.  
**Time 3:** A query function does not mutate state in both cases.  
**Time 5:** `stable var count` value is persisted after upgrade / reinstall.  
**Time 6:** `var count` is reset after upgrade / reinstall.  
**Time 7:** `var count` starts at `0`, while `stable var count` starts at `2`.  
**Time 10:** `var count` is reset again due to upgrade / reinstall , while `stable var count` persists its state.  

## Stable var types vs shared types
Recall that [shared types](/internet-computer-programming-concepts/async-data/shared-types.html) are always immutable. On the other hand, stable variables are always mutable. A subtle fact is that the *values* of *mutable stable variables* are restricted to values of shared types only.

### Non stable types
Suppose we have an [object](/common-programming-concepts/objects-and-classes/objects.html) like:
```motoko
{{#include _mo/stable-variables3.mo:a}}
```

We define a type of an object with a public field that is mutable. We assign an instance of that object to an immutable variable named `myObject`. We could now mutate the state of our public variable.

The restriction for stable variables is shown in the last comment. We can NOT assign an object instance with mutable fields as the value of a stable variable.  


## How it works
Declaring mutable variable(s) `stable` causes the following to happen *automatically* when [upgrading](/internet-computer-programming-concepts/basic-memory-persistence/simple-upgrades.html) our canister with new actor code:
- The value of the mutable variable(s) is *serialized* into [Candid format](/internet-computer-programming-concepts/async-data/candid.html#candid-serialization).
- The serialized Candid format is copied to [stable memory](/advanced-concepts/scalability/stable-storage.html).  
- The upgraded actor code (in the form of a [Wasm module](/internet-computer-programming-concepts/actors/actor-to-canister.html#code-compiling-and-wasm-modules)) is installed in the [canister](/internet-computer-programming-concepts/actors/actor-to-canister.html) and the state of the mutable variables is lost.
- The values in Candid format inside stable memory are retrieved and [*deserialized*](/internet-computer-programming-concepts/async-data/candid.html#candid-serialization).
- The same mutable variables of the new actor code are assigned the original deserialized values.   

