// ANCHOR: a
import Buffer "mo:base/Buffer";
let intStorage = Buffer.Buffer<Int>(0);
intStorage.add(-1);
intStorage.add(0);
intStorage.add(1);
 
let getOpt : ?Int = intStorage.getOpt(3);  //  null  
// ANCHOR_END: a