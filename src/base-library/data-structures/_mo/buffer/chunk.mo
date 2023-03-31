// ANCHOR: a
import Buffer "mo:base/Buffer";

let intStorage = Buffer.Buffer<Int>(0);

intStorage.add(-2);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);
intStorage.add(2);

let chunk : Buffer.Buffer<Buffer.Buffer<Int>> = Buffer.chunk<Int>(
      intStorage,
      3,
);

let array : [Buffer.Buffer<Int>] = Buffer.toArray<Buffer.Buffer<Int>>(chunk);

let array0 : [Int] = Buffer.toArray<Int>(array[0]);
let array1 : [Int] = Buffer.toArray<Int>(array[1]);
(array0, array1);
// ANCHOR_END: a
