
// ANCHOR: a
import Buffer "mo:base/Buffer";
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-2);
intStorage.add(-2);
intStorage.add(0);
intStorage.add(0);
intStorage.add(2);
intStorage.add(2);

func edit(x : Int, y : Int) : Bool {
  x == y;
};

let grouped : Buffer.Buffer<Buffer.Buffer<Int>> = Buffer.groupBy<Int>(
  intStorage,
  edit,
);

let array : [Buffer.Buffer<Int>] = Buffer.toArray<Buffer.Buffer<Int>>(grouped);

let array0 : [Int] = Buffer.toArray<Int>(array[0]);
let array1 : [Int] = Buffer.toArray<Int>(array[1]);
let array2 : [Int] = Buffer.toArray<Int>(array[2]);

(array0, array1, array2);      //([-2, -2], [0, 0], [2, 2])
// ANCHOR_END: a