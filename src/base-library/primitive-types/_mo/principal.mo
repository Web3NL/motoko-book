// Principal

// ANCHOR: a
import Principal "mo:base/Principal";
// ANCHOR_END: a

// ANCHOR: b
actor MyActor {} ;

let  actorsPrincipal : Principal = Principal.fromActor(MyActor);
// ANCHOR_END: b



