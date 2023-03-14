import Buffer "mo:base/Buffer";
// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(10);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);

let trimToSize : () = Buffer.trimToSize<Int>(intStorage);

intStorage.capacity();   // 3 : Nat
// ANCHOR_END: a
