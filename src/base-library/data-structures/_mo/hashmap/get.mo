// ANCHOR: a
import HashMap "mo:base/HashMap";
import Text "mo:base/Text";

let map = HashMap.HashMap<Text, Int>(5, Text.equal, Text.hash);
 map.put("Rohit", 30);
 map.put("Kohli", 28);
 map.put("Rahul", 27);

let get : ?Int = map.get("Kohli")
// ANCHOR_END: a