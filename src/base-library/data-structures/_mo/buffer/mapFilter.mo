import Buffer "mo:base/Buffer";
// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(10);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);
intStorage.add(2);

func filter(x : Int) : ?Int {
    if(x > 0) {
        ? (x*10)
    }else {
        null
    }
};

let newBuffer : Buffer.Buffer<Int> = Buffer.mapFilter<Int, Int>(intStorage, filter);
let array : [Int] = Buffer.toArray<Int>(newBuffer);  // [10, 20]
// ANCHOR_END: a
