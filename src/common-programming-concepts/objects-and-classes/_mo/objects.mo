// OBJECTS

// let obj = object {
//     private let x = 0;
// };

// type Obj = { y : Nat };

// let obj : Obj = object {
//     private let x = 0;
//     public let y = 0;
// };


// let obj = object {
//     private func f() {};
//     private let x = f;
// };

let obj = object {
    private func f() {};
    public let x = f;
};

// { x : () -> () }

let balance = object {
    private let initialBalance = 100;

    public var balance = initialBalance;

    public func addAmount( amount : Nat ) : Nat {
        balance += amount;
        balance
    }; 
};

// { 
//     addAmount : Nat -> Nat; 
//     var balance : Nat; 
// }

// ANCHOR: a
let result = obj.x();

let f = obj.x;
// ANCHOR_END: a
