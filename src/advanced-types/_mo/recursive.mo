// RECURSIVE TYPES

// ANCHOR: a
type List<T> = ?(T, List<T>);
// ANCHOR_END: a

// ANCHOR: b
let list : List<Nat> = null;
// ANCHOR_END: b

// ANCHOR: c
let list1 : List<Nat> = ?(0, null);
// ANCHOR_END: c

// ANCHOR: d
let list2 : List<Nat> = ?(1, list1);
// ANCHOR_END: d

// ANCHOR: e
func last<T>(l : List<T>) : ?T {
    switch l {
        case null { null };
        case (?(x, null)) { ?x };
        case (?(_, t)) { last<T>(t) };
    };
};
// ANCHOR_END: e
