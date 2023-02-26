// Error

// ANCHOR: a
import Error "mo:base/Error";
// ANCHOR_END: a

// ANCHOR: b
let error = Error.reject("Invalid input");
// ANCHOR_END: b

// ANCHOR: c
let errorCode = Error.code(error);
// ANCHOR_END: c

// ANCHOR: d
let errorMessage = Error.message(error);
// ANCHOR_END: d

