// CLASSES

// ANCHOR: a
type SomeObject = {};

type SomeClass = () -> SomeObject;
// ANCHOR_END: a

// ANCHOR: b
class MyClass() {
    private let a = 0;
    public let b = 1;
};
// ANCHOR_END: b

// ANCHOR: c
let myClassInstance = MyClass();
// ANCHOR_END: c

// ANCHOR: d
type ObjectType = {
    b : Nat;
};

let anotherClassInstance : ObjectType = MyClass();
// ANCHOR_END: d

// ANCHOR: e
class CryptoAccount(amount : Nat, multiplier : Nat) {
    private func calc(a : Nat, b : Nat) : Nat {
        a * b;
    };

    public var balance = calc(amount, multiplier);
};

let account1 = CryptoAccount(10, 5);
let account2 = CryptoAccount(10, 10);

account1.balance += 50;
account2.balance += 20;
// ANCHOR_END: e
