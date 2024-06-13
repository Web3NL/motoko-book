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
