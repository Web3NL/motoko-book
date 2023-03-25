// ANCHOR: a
import HashMap "mo:base/HashMap";
import Text "mo:base/Text";
import Iter "mo:base/Iter";

let map = HashMap.HashMap<Text, Int>(5, Text.equal, Text.hash);

map.put("Rohit", 30);
map.put("Kohli", 28);
map.put("Rahul", 27);

let iter : Iter.Iter<(Text, Int)> = map.entries();
 
Iter.toArray<(Text, Int)>(iter);
// ANCHOR_END: a