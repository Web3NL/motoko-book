actor {
    
// ANCHOR: a
public shared func f1(a1 : Int) : async Nat { 0 : Nat };
public shared func f2(a2 : Nat) : async Int { 0 : Int };
// ANCHOR_END: a

// ANCHOR: b
type F1 = shared Int -> async Nat;
type F2 = shared Nat -> async Int;
// ANCHOR_END: b

// ANCHOR: c
public shared func test() : async F2 { f1 };
// ANCHOR_END: c


}