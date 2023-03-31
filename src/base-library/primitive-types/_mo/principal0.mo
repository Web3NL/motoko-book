// Principal

// ANCHOR: b
import Principal "mo:base/Principal";

actor MyActor {};

let actorsPrincipal : Principal = Principal.fromActor(MyActor);
// ANCHOR_END: b
