// ANCHOR: a
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";
import Text "mo:base/Text";


let array : [(Text, Int)] = [("bitcoin", 1), ("ETH", 2), ("ICP", 20)];

let iter : Iter.Iter<(Text, Int)> = array.vals();

let size : Nat = array.size();

let map : HashMap.HashMap<Text, Int> = HashMap.fromIter<Text, Int>(
    iter,
    size,
    Text.equal,
    Text.hash,
);

map.get("bitcoin")
// ANCHOR_END: a