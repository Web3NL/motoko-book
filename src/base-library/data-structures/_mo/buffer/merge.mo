// ANCHOR: a
import Buffer "mo:base/Buffer";
import Int "mo:base/Int";

let intStorage1 = Buffer.Buffer<Int>(0);

intStorage1.add(-1);
intStorage1.add(0);
intStorage1.add(1);

let intStorage2 = Buffer.Buffer<Int>(0);

intStorage2.add(-2);
intStorage2.add(2);
intStorage2.add(3);

let merged : Buffer.Buffer<Int> = Buffer.merge<Int>(intStorage1, intStorage2, Int.compare);

Buffer.toArray<Int>(merged)
// ANCHOR_END: a