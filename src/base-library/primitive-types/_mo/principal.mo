// Principal

// ANCHOR: a
import Principal "mo:base/Principal";
// ANCHOR_END: a

// ANCHOR: b
actor MyActor {} ;

let  actorsPrincipal : Principal = Principal.fromActor(MyActor);
// ANCHOR_END: b

// ANCHOR: d
let textualPrincipal : Text = "un4fu-tqaaa-aaaab-qadjq-cai";

let principal : Principal = Principal.fromText(textualPrincipal);
// ANCHOR_END: d

// ANCHOR: c
let principal : Principal = Principal.fromText("un4fu-tqaaa-aaaab-qadjq-cai");

let textualPrincipal : Text = Principal.toText(principal);
// ANCHOR_END: c

// ANCHOR: e
let principal : Principal = Principal.fromText("un4fu-tqaaa-aaaab-qadjq-cai");

let blob : Blob  = Principal.toBlob(principal);
// ANCHOR_END: e

// ANCHOR: f
let principal : Principal = Principal.fromText("un4fu-tqaaa-aaaab-qadjq-cai");

let blob : Blob  = Principal.toBlob(principal);

let principle2 : Principal = Principal.fromBlob(blob);
// ANCHOR_END: f

// ANCHOR: g
let principal : Principal = Principal.fromText("un4fu-tqaaa-aaaab-qadjq-cai");

let isAnonymous : Bool = Principal.isAnonymous(principal);

assert isAnonymous == false;
// ANCHOR_END: g

