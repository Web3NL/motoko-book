// ANCHOR: a
import Buffer "mo:base/Buffer";

let intStorageN = Buffer.Buffer<Int>(0);

intStorageN.add(-3);
intStorageN.add(-2);
intStorageN.add(-1);

let intStorageP = Buffer.Buffer<Int>(0);

intStorageP.add(0);
intStorageP.add(1);
intStorageP.add(3);

let bufferStorage = Buffer.Buffer<Buffer.Buffer<Int>>(1);

bufferStorage.add(intStorageN);
bufferStorage.add(intStorageP);

let flat : Buffer.Buffer<Int> = Buffer.flatten<Int>(bufferStorage);

Buffer.toArray<Int>(flat);
// ANCHOR_END: a
