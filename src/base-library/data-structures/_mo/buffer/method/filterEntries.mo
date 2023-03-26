// ANCHOR: a
import Buffer "mo:base/Buffer";

let intStorage = Buffer.Buffer<Int>(0);

intStorage.add(-2);
intStorage.add(2);
intStorage.add(3);
intStorage.add(4);
intStorage.add(7);

func check(index : Nat, value : Int) : Bool {
      value % 2 == 0;
    };

intStorage.filterEntries(check);

Buffer.toArray(intStorage);
// ANCHOR_END: a