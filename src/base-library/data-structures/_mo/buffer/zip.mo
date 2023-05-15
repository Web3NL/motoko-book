N// ANCHOR: a
import Buffer "mo:base/Buffer";

let intStorageN = Buffer.Buffer<Int>(0);

intStorageN.add(-3);
intStorageN.add(-2);
intStorageN.add(-1);

let intStorageP = Buffer.Buffer<Int>(0);

intStorageP.add(3);
intStorageP.add(2);

let zipped : Buffer.Buffer<(Int, Int)> = Buffer.zip<Int, Int>(
      intStorageN,
      intStorageP,
);

Buffer.toArray<(Int, Int)>(zipped)
// ANCHOR_END: a
