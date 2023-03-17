import Buffer "mo:base/Buffer";
// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-2);
intStorage.add(2);
intStorage.add(3);
intStorage.add(4);
intStorage.add(7);

func check(index : Nat, value : Int) : Bool {
      value % 2 == 0;
    };

let filterEntries = intStorage.filterEntries(check);

let array : [Int] = Buffer.toArray(intStorage);  // [-2, 2, 4]
// ANCHOR_END: a
