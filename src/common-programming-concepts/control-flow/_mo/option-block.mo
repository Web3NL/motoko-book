// OPTION
let hoursInput: ?Nat = ?3;

ignore do {
let z = ?10;
// ANCHOR: a
let y = 2;

do ? { 
    let x = 5; 
 
    x * y * z ! 
}

// (z = 10)   evaluates to 100
// (z = 0)   evaluates to 0
// (z = null) evaluates to null
// ANCHOR_END: a
};

ignore do {
let z = ?10;
// ANCHOR: b
let y = 2;

do ? {
    if (z ! == 0) null ! ; 
    //if (z == ?0) null ! ; could also be used
    let x = 5;

    x * y * z !
}

// (z = 10)   evaluates to 100
// (z = 0)   evaluates to null
// (z = null) evaluates to null
// ANCHOR_END: b
};

ignore do {
// ANCHOR: c
func noZero(x: ?Nat) : ?Nat {
    if (x == ?0) null else x;
};

let seconds = do ? {
    let hours = noZero(hoursInput) ! ;
    let multiplier = 60 * 60;
    hours * multiplier
};
// ANCHOR_END: c
};

ignore do {
// ANCHOR: d
func noZero(x: ?Nat) : ?Nat {
    if (x == ?0) null else x;
};

let seconds = do ? {
    let hours = noZero(hoursInput);
    let multiplier = 60 * 60;
    hours ! * multiplier
};
// ANCHOR_END: d
};

ignore do {
func noZero(x: ?Nat) : ?Nat {
    if (x == ?0) null else x;
};
let n = ?0;
let x = ?0;
func getCost():?Nat{null};
func getTax(x:Nat, y:Nat):?Nat{null};
func multiply(){};
let Debug = object {
    public func print(amount : Nat) : Nat {
        amount
    };
};
// ANCHOR: e
ignore do ? {
    let amount = noZero(n) ! ;
    let eachCost = getCost() ! ;
    let tax = getTax(eachCost, amount) ! ;
    Debug.print((amount * eachCost) + tax) ;
};
// ANCHOR_END: e
};


// public shared func incrementSide() : async Result.Result<Nat, Text>  {
//     func incrementCount() : Nat {
//       count += 1;
//       count
//     };

//     /* ignore do {
//       incrementCount()
//     }; */

//     let _ = do {  
//       incrementCount()
//       };

//     ignore do {incrementCount()};

//     /* try {
//       incrementCount();
//     } catch err {
//       return #err("Error")
//     };*/

//     #ok count;
//   };


// ANCHOR: x
// func calcButNoZeroSwitch(number : ?Nat) : async ?Nat {
//     do ? {
//         // let n = switch (number){
//         //     case (null) null ! ;
//         //     case (?0) null ! ;
//         //     case (?value) value;      
//         // };
//         let ?n = noZero(number) else null !;
//         let result = n * 5;
//         result;
//     };
// };
// ANCHOR_END: x

