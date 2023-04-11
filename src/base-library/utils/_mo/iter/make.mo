// ANCHOR: a
import Iter "mo:base/Iter";

let myRange : Iter.Iter<Nat> = Iter.make(3);

assert(?3 == myRange.next());
assert(?3 == myRange.next());
assert(?3 == myRange.next());
//......
// ANCHOR_END: a
