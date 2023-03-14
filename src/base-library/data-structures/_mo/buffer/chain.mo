import Buffer "mo:base/Buffer";
// ANCHOR: a
let intStorageA = Buffer.Buffer<Int>(0);
intStorageA.add(1);
intStorageA.add(2);
intStorageA.add(3);

func change(x : Int) : Buffer.Buffer<Int> {
let intStorageB = Buffer.Buffer<Int>(2);
intStorageB.add(x);
intStorageB.add(x**3);
intStorageB
};

let chain = Buffer.chain<Int,Int>(intStorageA, change);

let array : [Int] = Buffer.toArray(chain);  // [1 ,1, 2, 8, 3, 27]
// ANCHOR_END: a
