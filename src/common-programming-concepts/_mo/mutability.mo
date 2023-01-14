// MUTABILITY

// ANCHOR: a
var x = 1;
// ANCHOR_END: a

// ANCHOR: b
x := 2;
// ANCHOR_END: b

// ANCHOR: c
var city = "Amsterdam";
// ANCHOR_END: c

// ANCHOR: d
let newYork = "New York";
let berlin = "Berlin";
// ANCHOR_END: d

// ANCHOR: e
city := newYork; // variable city now has text value "New York"
city := berlin; // variable city now has text value "Berlin"
city := "Paris"; // variable city now has text value "Paris"
// ANCHOR_END: e