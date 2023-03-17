import Buffer "mo:base/Buffer";
// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let buffer1 = Buffer.Buffer<Int>(2);

    buffer1.add(4);

   let insertBuffer = intStorage.insertBuffer(3, buffer1);

   let array : [Int]= Buffer.toArray(intStorage);  // [-1, 0, 1, 4]
// ANCHOR_END: a
