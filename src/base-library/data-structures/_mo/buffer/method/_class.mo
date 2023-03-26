// ANCHOR: a
import Buffer "mo:base/Buffer";

type Buffer<X> = Buffer.Buffer<X>;

let myBuffer : Buffer<Nat> = Buffer.Buffer<Nat>(100);
// ANCHOR_END: a