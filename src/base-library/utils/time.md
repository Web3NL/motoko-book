# Time
The *convention* is to name the [*module alias*](/common-programming-concepts/modules.html#imports) after the [*file name*](/common-programming-concepts/modules.html#imports) it is defined in:

```motoko
{{#include _mo/time.mo:a}}
```

## Time.now
The function `now` takes `NO` argument and returns an `Int` value. that represents the number of nanoseconds since January 1st, 1970.  

```motoko
{{#include _mo/time.mo:b}}
```
# currentYearFrom1970
In order to find the currentYearFrom1970, the currentTime in nanoseconds is divided by the number of nanoseconds in one minute, hour, day, month, and year respectively. This calculation results in the number of years that have passed since January 1st, 1970.

The "assert" statement checks that the calculated number of years is equal to 53. If the calculation is correct, the assertion will pass.
