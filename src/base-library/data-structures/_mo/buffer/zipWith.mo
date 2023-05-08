// ANCHOR: a
import Buffer "mo:base/Buffer";

let intStorageN = Buffer.Buffer<Int>(0);

intStorageN.add(-3);
intStorageN.add(-2);
intStorageN.add(-1);

let intStorageP = Buffer.Buffer<Int>(0);

intStorageP.add(3);
intStorageP.add(2);

func edit(x : Int, y : Int) : Int {
      x * y;
};

let zipped : Buffer.Buffer<Int> = Buffer.zipWith<Int, Int, Int>(
      intStorageN,
      intStorageP,
      edit,
);

Buffer.toArray<Int>(zipped)
// ANCHOR_END: a
