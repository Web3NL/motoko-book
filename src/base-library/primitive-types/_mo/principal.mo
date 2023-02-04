// Principal

// ANCHOR: a
import Principal "mo:base/Principal";
// ANCHOR_END: a

// ANCHOR: b
actor MyActor {} ;

let  actorsPrincipal : Principal = Principal.fromActor(MyActor);
// ANCHOR_END: b

// ANCHOR: c
let textualPrincipal : Text = Principal.toText(actorsPrincipal);
// ANCHOR_END: c

// ANCHOR: d
let principal : Principal = Principal.fromText(textualPrincipal);
// ANCHOR_END: d

// ANCHOR: e
let principalToBlob  = Principal.toBlob(principal);
// ANCHOR_END: e

// ANCHOR: f
let blobToPrincipal = Principal.fromBlob(principalToBlob);
// ANCHOR_END: f

// ANCHOR: g
let isAnonymous = Principal.isAnonymous(principal);

assert isAnonymous == false;
// ANCHOR_END: g


let p : Principal = Principal.fromActor(MyActor); 
// ANCHOR_END: a