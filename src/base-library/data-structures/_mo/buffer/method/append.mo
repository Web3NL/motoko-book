// ANCHOR: a
import Buffer "mo:base/Buffer";

let intStorage1 = Buffer.Buffer<Int>(0);

intStorage1.add(-1);
intStorage1.add(0);
intStorage1.add(1);

let intStorage2 = Buffer.Buffer<Int>(0);
intStorage2.add(2);

intStorage1.append(intStorage2);

Buffer.toArray(intStorage1);
// ANCHOR_END: a
