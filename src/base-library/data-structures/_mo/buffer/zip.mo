
// ANCHOR: a
import Buffer "mo:base/Buffer";
let intStorageP = Buffer.Buffer<Int>(0);
intStorageP.add(-3);
intStorageP.add(-2);
intStorageP.add(-1);

let intStorageN = Buffer.Buffer<Int>(0);
intStorageN.add(3);
intStorageN.add(2);

let zipped : Buffer.Buffer<(Int, Int)> = Buffer.zip<Int, Int>(
      intStorageP,
      intStorageN,
);

let array : [(Int, Int)] = Buffer.toArray<(Int, Int)>(zipped); // [(-3, 3), (-2, 2)]
// ANCHOR_END: a