import Buffer "mo:base/Buffer";

// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(0);
    intStorage.add(-3);
    intStorage.add(-2);
    intStorage.add(-1);
    intStorage.add(0);

    func check(x : Int) : Bool {
      x < 0;
    };

    let newBuffer : Buffer.Buffer<Int> = Buffer.takeWhile<Int>(
      intStorage,
      check,
    );

    let array : [Int] = Buffer.toArray<Int>(newBuffer);
    // [-3, -2, -1]
// ANCHOR_END: a
