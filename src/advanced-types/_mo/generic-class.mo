// ANCHOR: a
import Array "mo:base/Array";

class MyClass<T>(n : Nat, initVal : T) {
    public let array : [var T] = Array.init<T>(n, initVal);
};
// ANCHOR_END: a

// ANCHOR: b
let myObject = MyClass<Bool>(2, true);

// myClass.array now has value [true, true]
myObject.array[0] := false;
// ANCHOR_END: b
