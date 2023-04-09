# Shared Types

Incoming and outgoing data are defined by the _argument types_ and _return types_ of [public shared functions](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) inside actors. Incoming and outgoing data types are restricted to a _subset_ of available Motoko types, called _shared types_.

Shared types are always _immutable_ types or data structures composed of immutable types (like [records](/common-programming-concepts/types/records.html), [objects](/common-programming-concepts/objects-and-classes/objects.html) and [variants](/common-programming-concepts/types/variants.html)).

Shared types get their name from being _sharable_ with the outside world, that is the wider internet beyond the [actors](/internet-computer-programming-concepts/actors.html) running in [canisters](/internet-computer-programming-concepts/actors/actor-to-canister.html) on the Internet Computer.

## Shared Types in Public Shared Functions

Only shared types are allowed for _arguments_ and _return values_ of public shared functions. We give examples of a custom _public shared function type_ called `SharedFunction` to illustrate shared types. [Recall](/internet-computer-programming-concepts/actors.html#actor-type) that a public shared function type includes the `shared` and `async` keywords.

Here are the most important shared types in Motoko.

### Shared Primitive Types

All [primitive types](/common-programming-concepts/types.html#primitive-types) (except the [`Error`](/base-library/utils/error.html) type) are shared.

```motoko
type SharedFunction = shared Nat -> async Text;
```

The argument of type `Nat` and the return value of type `Text` are shared types.

### Shared Option Types

Any shared type in Motoko can be turned into an [_Option_](/common-programming-concepts/options-and-results.html) type which remains shared.

```motoko
type SharedFunction = shared ?Principal -> async ?Bool;
```

The argument of type `?Principal` and the return value of type `?Bool` are shared types.

### Shared Tuple Types

[Tuples](/common-programming-concepts/types/tuples.html) consisting of shared types are also shared, that is they are _shared tuple types_.

```motoko
type SharedFunction = shared (Nat, Int, Float) -> async (Principal, Text);
```

The argument `(Nat, Int, Float)` and the return value `(Principal, Text)` are shared tuple types.

### Shared Immutable Array Types

[Immutable arrays](/common-programming-concepts/types/immutable-arrays.html) consisting of shared types are also shared, that is they are _shared immutable array types_.

```motoko
type SharedFunction = shared [Int] -> async [Nat];
```

The types `[Int]` and `[Nat]` are shared immutable array types.

### Shared Variant Types

[Variant types](/common-programming-concepts/types/variants.html) that have _shared associated types_ are also shared.

```motoko
type GenderAge = {
  #Male : Nat;
  #Female : Nat;
};

type SharedFunction = shared GenderAge -> async GenderAge;
```

The variant type `GenderAge` is a shared type because `Nat` is also shared.

### Shared Object Types

[Object types](/common-programming-concepts/types/variants.html) that have _shared field types_ are also shared.

```motoko
type User = {
  id : Principal;
  genderAge : GenderAge;
};

type SharedFunction = shared User -> async User;
```

Object type `User` is a shared type because `Principal` and `GenderAge` are also shared types.

### Shared Function Types

[Shared function types](/internet-computer-programming-concepts/actors.html#public-shared-functions-in-actors) are also shared types. This example shows a shared public function that has another shared public function as its argument and return type.

```motoko
type CheckBalance = shared() -> async Nat;

type SharedFunction = shared CheckBalance -> async CheckBalance;
```

`CheckBalance` is a shared type because it is the type of a public shared function.

### Shared Actor Types

All [actor types](/internet-computer-programming-concepts/actors.html#actor-type) are shared types.

```motoko
Account = actor {
  checkBalance : shared() -> async Nat;
};

type SharedFunction = shared Account -> async Account;
```

`Account` is a shared type because it is the type of an actor.
