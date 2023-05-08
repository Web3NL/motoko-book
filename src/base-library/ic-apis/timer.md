# Timer

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

```motoko
{{#include _mo/timer/setTimer.mo:a}}
```

## Timer.recurringTimer

```motoko
func recurringTimer(d : Duration, job : () -> async ()) : TimerId
```

```motoko
{{#include _mo/timer/recurringTimer.mo:a}}
```

## Timer.cancelTimer

```motoko
func cancelTimer : TimerId -> ()
```

```motoko
{{#include _mo/timer/cancelTimer.mo:a}}
```
