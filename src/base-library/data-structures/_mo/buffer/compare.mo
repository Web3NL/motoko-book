// ANCHOR: a
import Buffer "mo:base/Buffer";
import Order "mo:base/Order";
import Int "mo:base/Int";

let intStorage1 = Buffer.Buffer<Int>(0);

intStorage1.add(-1);
intStorage1.add(0);
intStorage1.add(1);

let intStorage2 = Buffer.Buffer<Int>(0);

intStorage2.add(-1);
intStorage2.add(0);
intStorage2.add(1);

Buffer.compare<Int>(intStorage1, intStorage2, Int.compare);
// ANCHOR_END: a