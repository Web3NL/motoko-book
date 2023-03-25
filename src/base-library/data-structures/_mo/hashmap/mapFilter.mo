// ANCHOR: a
import HashMap "mo:base/HashMap";
import Text "mo:base/Text";

let map = HashMap.HashMap<Text, Int>(5, Text.equal, Text.hash);

map.put("sachin", 100);
map.put("kohli", 74);
map.put("root", 50);

func edit(k : Text, v : Int) : ?Int {
     if (v > 0) {
       ?(v * 2);
   } else {
       null;
  };
};

let mapFilter : HashMap.HashMap<Text, Int> = HashMap.mapFilter<Text, Int, Int>(
    map,
    Text.equal,
    Text.hash,
    edit,
);

mapFilter.get("root")
// ANCHOR_END: a