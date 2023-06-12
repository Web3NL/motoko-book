# Timer

Timers on the IC can be set to schedule _one-off_ or _periodic tasks_ using the [`setTimer`](#timersettimer) and [`recurringTimer`](#timerrecurringtimer) functions respectively.

These functions take a [`Duration`](#type-duration) variant that specifies the time in either seconds or nanoseconds. Also, a callback function (the _job_ to be performed) with type `() -> async ()` is passed to the timer functions that will be called when the timer expires.

`setTimer` and `recurringTimer` return a [`TimerId`](#type-timerid) that can be used to cancel the timer before it expires. Timers are canceled with [`cancelTimer`](#timercanceltimer).

The _convention_ is to name the [_module alias_](/common-programming-concepts/modules.html#type-imports-and-renaming) after the [_file name_](/common-programming-concepts/modules.html#type-imports-and-renaming) it is defined in.

```motoko
{{#include _mo/timer/timer.mo:a}}
```

### On this page

[Type `Duration`](#type-duration)  
[Type `TimerId`](#type-timerid)

[Function `setTimer`](#timersettimer)  
[Function `recurringTimer`](#timerrecurringtimer)  
[Function `cancelTimer`](#timercanceltimer)

## Type `Duration`

```motoko
type Duration = {#seconds : Nat; #nanoseconds : Nat}
```

## Type `TimerId`

```motoko
type TimerId = Nat
```

## Timer.setTimer

```motoko
func setTimer(d : Duration, job : () -> async ()) : TimerId
```

## Timer.recurringTimer

```motoko
func recurringTimer(d : Duration, job : () -> async ()) : TimerId
```

## Timer.cancelTimer

```motoko
func cancelTimer : TimerId -> ()
```
