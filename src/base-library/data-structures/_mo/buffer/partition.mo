import Buffer "mo:base/Buffer";
// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(2);
intStorage.add(-2);
intStorage.add(1);
intStorage.add(3);

func part(x : Int) : Bool {
    x > 0;
};

let partitions = Buffer.partition<Int>(intStorage,part);
let tuple : ([Int], [Int]) = (Buffer.toArray(partitions.0), Buffer.toArray(partitions.1)) // => ([0, -1, -2], [1, 2, 3])
// ANCHOR_END: a