// PRINCIPAL

import Principal "mo:base/Principal";

// ANCHOR: a
actor MyActor {};

let p : Principal = Principal.fromActor(MyActor); 
// ANCHOR_END: a