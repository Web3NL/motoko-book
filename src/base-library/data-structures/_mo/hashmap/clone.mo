// ANCHOR: a
import HashMap "mo:base/HashMap";
import Text "mo:base/Text";

let map = HashMap.HashMap<Text, Int>(5, Text.equal, Text.hash);

map.put("sachin", 100);
map.put("kohli", 74);
map.put("root", 50);

let copy = HashMap.clone(map, Text.equal, Text.hash);

copy.get("kohli")
// ANCHOR_END: a
