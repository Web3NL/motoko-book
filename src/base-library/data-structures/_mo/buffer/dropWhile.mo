
// ANCHOR: a
import Buffer "mo:base/Buffer";
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-3);
intStorage.add(-2);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

func check(x : Int) : Bool {
  x < 0;
};

let newBuffer : Buffer.Buffer<Int> = Buffer.dropWhile<Int>(
  intStorage,
  check,
);

let array : [Int] = Buffer.toArray<Int>(newBuffer);  // [0, 1]
// ANCHOR_END: a