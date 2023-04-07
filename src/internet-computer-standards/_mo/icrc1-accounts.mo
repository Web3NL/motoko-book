// ANCHOR: a
import Principal "mo:base/Principal";
import Blob "mo:base/Blob";

// Default account
let account1 : Account = {
    owner = Principal.fromText("un4fu-tqaaa-aaaab-qadjq-cai");
    subaccount = null;
};

// Account with specific subaccount
let subaccount : ?Blob = ?Blob.fromArray([
    1,
    1,
    1,
    1,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
]);

let account2 : Account = {
    owner = Principal.fromText("un4fu-tqaaa-aaaab-qadjq-cai");
    subaccount;
};
// ANCHOR_END: a

type Account = {
    owner : Principal;
    subaccount : ?Subaccount;
};

type Subaccount = Blob;
