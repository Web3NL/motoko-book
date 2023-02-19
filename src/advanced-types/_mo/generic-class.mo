// ANCHOR: a
import Array "mo:base/Array";

class MyClass<T>(n : Nat, initVal : T) {
    public let array = Array.init<T>(n, initVal);
};
// ANCHOR_END: a

// ANCHOR: b
let myClass = MyClass<Bool>(2, true);

// myClass.array now has value [true, true]
let firstElement : Bool = myClass.array[0];
// ANCHOR_END: b

