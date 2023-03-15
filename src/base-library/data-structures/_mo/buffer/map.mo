import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(10);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

func change(x : Int) : Int {
    x**2
};

let newBuffer : Buffer.Buffer<Int> = Buffer.map<Int, Int>(intStorage, change);

let text : Text = Buffer.toText(newBuffer, Int.toText); // => "[1, 0, 1]"
// ANCHOR_END: a
