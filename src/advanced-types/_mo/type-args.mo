// ANCHOR: a
type CustomType<T> = (Nat, Int, T);
// ANCHOR_END: a

// ANCHOR: b
let x : CustomType<Bool> = (0, -1, true);
// ANCHOR_END: b

// ANCHOR: c
let y : CustomType<Float> = (100, -100, 0.5);

let z : CustomType<[Nat]> = (100, -100, [7, 6, 5]);
// ANCHOR_END: c