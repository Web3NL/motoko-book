import Buffer "mo:base/Buffer";
// ANCHOR: a
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);
 
let getOpt = intStorage.getOpt(3);  //  null  
// ANCHOR_END: a
