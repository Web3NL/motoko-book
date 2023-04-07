// ANCHOR: a
import Buffer "mo:base/Buffer";

let intStorage = Buffer.Buffer<Int>(0);

intStorage.add(-2);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);
intStorage.add(2);

let splits = Buffer.split<Int>(intStorage, 2);

let tuple : ([Int], [Int]) = (Buffer.toArray<Int>(splits.0), Buffer.toArray<Int>(splits.1))
// ANCHOR_END: a
