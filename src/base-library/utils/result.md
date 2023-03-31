# Result
The *convention* is to name the [*module alias*](/common-programming-concepts/modules.html#imports) after the [*file name*](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/result/result.mo:a}}
```
### On this page

[Type `Result<Ok, Err>`](#type)

[Function `fromOption`](#resultfromoption)  
[Function `toOption`](#resulttooption)  
[Function `isOk`](#resultisok)  
[Function `isErr`](#resultiserr)  


## Type

The Result type is commonly used in programming to represents

```motoko
{{#include _mo/result/type.mo:a}}
```

## Result.fromOption

```motoko
func fromOption<R, E>(x : ?R, err : E) : Result<R, E>
```
The function `fromOption` takes two generic argument and returns a value of type`Result`. 

```motoko, run
{{#include _mo/result/result1.mo:a}}
```

## Result.toOption

```motoko
func toOption<R, E>(r : Result<R, E>) : ?R
```
The function `toOption` takes one argument of type`Result` and returns an `Option` value .

```motoko, run
{{#include _mo/result/result2.mo:a}}
```

## Result.isOk

```motoko
func isOk(r : Result<Any, Any>) : Bool
```
The function `isOk` takes one argument of type`Result` and returns a `Bool` value .

```motoko, run
{{#include _mo/result/result3.mo:a}}
```

## Result.isErr

```motoko
func isErr(r : Result<Any, Any>) : Bool
```
The function `isErr` takes one argument of type`Result` and returns a `Bool` value .

```motoko, run
{{#include _mo/result/result4.mo:a}}
```




<!-- 
Function fromOption
Function toOption
Function isOk
Function isErr
 -->