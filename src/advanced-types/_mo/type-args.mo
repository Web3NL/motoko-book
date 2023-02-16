// ANCHOR: a
type CustomType<T> = (Nat, Int, T);
// ANCHOR_END: a

// ANCHOR: b
let x : CustomType<Bool> = (0, -1, true);
// ANCHOR_END: b