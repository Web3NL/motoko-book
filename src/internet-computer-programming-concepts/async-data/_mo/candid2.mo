// ANCHOR: a
type A = { #a : Nat; #b : Int };

type B = { #a : Int; #b : Nat };

type MyData = {
    title : Text;
    a : A;
    b : B;
};
// ANCHOR_END: a

// ANCHOR: b
let data : MyData = {
    title = "Motoko";
    a = #a(1);
    b = #a(-1);
};

let blob : Blob = to_candid (data);
// ANCHOR_END: b

// ANCHOR: c
let deserialized_data : ?MyData = from_candid (blob);

switch (deserialized_data) {
    case null {};
    case (?data) {};
};
// ANCHOR_END: c
