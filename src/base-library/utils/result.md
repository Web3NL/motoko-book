

# Result

This is a subset of functions available in the [official reference](https://internetcomputer.org/docs/current/motoko/main/base/Result) for working with `Result` variants. See [this chapter of this book](/common-programming-concepts/options-and-results.html) for more information on `Result`.  

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/result/result.mo:a}}
```

### On this page

[Public type `Result<Ok, Err>`](#public-type)

[Function `fromOption`](#resultfromoption)  
[Function `toOption`](#resulttooption)  
[Function `isOk`](#resultisok)  
[Function `isErr`](#resultiserr)

## Public type

The `Result<Ok, Err>` type is a [variant](/common-programming-concepts/types/variants.html) with two [generic parameters](/advanced-types/generics.html#type-parameters-and-type-arguments). It can be used as the return type for functions to indicate either _success_ or _error_. Both cases can be handled _programmatically_.

```motoko
{{#include _mo/result/type.mo:a}}
```

A `Result<Ok, Err>` could either be

- `#ok(x)` where `x` is of [generic type](/advanced-types/generics.html#generics-in-type-declarations) `Ok`
- `#err(x)` where `x` is of [generic type](/advanced-types/generics.html#generics-in-type-declarations) `Err`

We usually [import](/common-programming-concepts/modules.html#type-imports-and-renaming), [rename](/common-programming-concepts/modules.html#type-imports-and-renaming) and instantiate `Result` with types for our own purpose and use it as the return type of a function.

```motoko
{{#include _mo/result/type2.mo:a}}
```

We import `Result` and declare our own custom type `MyResult` by instantiating the `Result<Ok, Err>` with types `Nat` and `Text`.

Our function `doSomething` could either return a `#ok` with a `Nat` value or a `#err` with a `Text` value.

Both cases are handled _programmatically_ in the last [switch expression](/common-programming-concepts/control-flow/switch-expression.html). The return values associated with both cases are locally named `nat` and `text` and could be used inside the switch case body.

## Result.fromOption

```motoko
func fromOption<R, E>(x : ?R, err : E) : Result<R, E>
```

```motoko, run
{{#include _mo/result/result1.mo:a}}
```

## Result.toOption

```motoko
func toOption<R, E>(r : Result<R, E>) : ?R
```

```motoko, run
{{#include _mo/result/result2.mo:a}}
```

## Result.isOk

```motoko
func isOk(r : Result<Any, Any>) : Bool
```

```motoko, run
{{#include _mo/result/result3.mo:a}}
```

## Result.isErr

```motoko
func isErr(r : Result<Any, Any>) : Bool
```

```motoko, run
{{#include _mo/result/result4.mo:a}}
```
