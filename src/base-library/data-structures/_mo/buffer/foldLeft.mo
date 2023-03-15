import Buffer "mo:base/Buffer";
// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(1);
intStorage.add(2);

func change(x : Int, y : Int) : Int {
    x + y
};

let foldLeft : Int = Buffer.foldLeft<Int, Int>(intStorage, 0, change); // 2
// ANCHOR_END: a
