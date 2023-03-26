// ANCHOR: a
import Buffer "mo:base/Buffer";

let intStorage = Buffer.Buffer<Int>(0);

intStorage.add(-3);
intStorage.add(-2);
intStorage.add(-1);
intStorage.add(0);

func check(x : Int) : Bool {
      x < 0;
};

let newBuffer : Buffer.Buffer<Int> = Buffer.takeWhile<Int>(
      intStorage,
      check,
);

Buffer.toArray<Int>(newBuffer)
// ANCHOR_END: a