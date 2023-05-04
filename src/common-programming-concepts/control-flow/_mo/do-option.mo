// DO
let hoursInput: ?Nat = ?3;

ignore do {
// ANCHOR: a
do { 
    let x = 5;
    let y = 2;
    x * y 
}

// this evaluates to 10
// ANCHOR_END: a
};

ignore do {
// ANCHOR: b
let y = 10;

let x = do { 
    let x = 5;
    let y = 2;
    x * y 
};

// x evaluates to 10, the first declared y has no effect
// ANCHOR_END: b
};

ignore do {
// ANCHOR: c
let y = 10;

let x = y * (do { 
    let x = 5;
    let y = 2;
    x * y 
})

// x evaluates to 100
// ANCHOR_END: c
};

ignore do {
// ANCHOR: d
let y = 10;

let x = y * (do { 
    let x = 5;

    x * y 
})

//x evaluates to 500
// ANCHOR_END: d
};

ignore do {
let z = ?10;
// ANCHOR: e
let y = 2;

do ? { 
    let x = 5; 
 
    x * y * z ! 
}

// (z = 10)   evaluates to 100
// (z = 0)   evaluates to 0
// (z = null) evaluates to null
// ANCHOR_END: e
};

ignore do {
let z = ?10;
// ANCHOR: f
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
// ANCHOR_END: f
};

ignore do {
// ANCHOR: g
func noZero(x: ?Nat) : ?Nat {
    if (x == ?0) null else x;
};

let seconds = do ? {
    let hours = noZero(hoursInput) ! ;
    let multiplier = 60 * 60;
    hours * multiplier
};
// ANCHOR_END: g
};

ignore do {
// ANCHOR: h
func noZero(x: ?Nat) : ?Nat {
    if (x == ?0) null else x;
};

let seconds = do ? {
    let hours = noZero(hoursInput);
    let multiplier = 60 * 60;
    hours ! * multiplier
};
// ANCHOR_END: h
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
// ANCHOR: i
ignore do ? {
    let amount = noZero(n) ! ;
    let eachCost = getCost() ! ;
    let tax = getTax(eachCost, amount) ! ;
    Debug.print((amount * eachCost) + tax) ;
};
// ANCHOR_END: i
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

