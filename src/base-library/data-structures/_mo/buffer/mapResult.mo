// ANCHOR: a
import Buffer "mo:base/Buffer";
import Result "mo:base/Result";
let intStorage = Buffer.Buffer<Int>(10);
intStorage.add(0);
intStorage.add(1);
intStorage.add(2);

func filter(x : Int) : Result.Result<Int,Text> {
    if(x > 0) {
        #ok(x*10)
    }else {
        #err("got negative number")
    }
};


let result : Result.Result<Buffer.Buffer<Int>, Text> = Buffer.mapResult<Int, Int, Text>(intStorage, filter);

func toArray(arg : Buffer.Buffer<Int>) : [Int] {
let array : [Int] = Buffer.toArray<Int>(arg); 
};

Result.mapOk<Buffer.Buffer<Int>, [Int], Text>(result, toArray) // => #ok([10, 20]) 
// ANCHOR_END: a