// ANCHOR: a
import Buffer "mo:base/Buffer";
import Int "mo:base/Int";
let varArray : [var Int] = [var -1, 0, 1];

let buffer : Buffer.Buffer<Int> = Buffer.fromVarArray<Int>(varArray); 
let text : Text = Buffer.toText(buffer, Int.toText); //  => "[-1, 0, 1]"; 
// ANCHOR_END: a