import Buffer "mo:base/Buffer";
// ANCHOR: a

let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(2);
intStorage.add(-3);
intStorage.add(4);
intStorage.add(-5);
intStorage.add(6);

func part(arg : Int) :Int {
    x % 2 == 0;
};

let partitions = intStorage.partition<Int>(intStorage, part);

let array : [Int] = Buffer.toArray(intStorage);
// ANCHOR_END: a
