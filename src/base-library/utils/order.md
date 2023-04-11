> **BETA WARNING** _This chapter is being reviewed and updated_

# Order

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/order.mo:a}}
```

### On this page

[Public type `Order`](#public-type)

[Function `isLess`](#orderisless)  
[Function `isEqual`](#orderisequal)  
[Function `isGreater`](#orderisgreater)  
[Function `equal`](#orderequal)

## Public Type

The `Order` [variant](/common-programming-concepts/types/variants.html) type is used to represent three possible outcomes when comparing the _order_ two values.

```motoko
{{#include _mo/order.mo:b}}
```

When comparing the order of two values, we could either return:

- `#less` when the first value is less than the second value.
- `#equal` when both values are equal.
- `#greater` when the first value is greater than the second value.

Some types are naturally ordered like number types [`Nat`](/base-library/primitive-types/nat.html) and [`Int`](/base-library/primitive-types/int.html). But we may define an order for any type, even types for which there is no obvious natural order.

```motoko, run
{{#include _mo/order.mo:c}}
```

Here we define an order for our `Color` variant by defining a function that compares two values of `Color` and returns an `Order`. It treats `#Red` to be `#greater` than `#Blue`.

## Order.isLess

```motoko
func isLess(order : Order) : Bool
```

```motoko, run
{{#include _mo/order1.mo:a}}
```

## Order.isEqual

```motoko
func isEqual(order : Order) : Bool
```

```motoko, run
{{#include _mo/order2.mo:a}}
```

## Order.isGreater

```motoko
func isGreater(order : Order) : Bool
```

```motoko, run
{{#include _mo/order3.mo:a}}
```

## Order.equal

```motoko
func equal(o1 : Order, o2 : Order) : Bool
```

```motoko, run
{{#include _mo/order4.mo:a}}
```
