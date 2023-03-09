// PATTERN MATCHING

// ANCHOR: a
let individual = ("Male", 30);

let (gender, age) = individual;

// ANCHOR_END: a

// ANCHOR: b
let person = {
    name = "Peter";
    member = false;
};

let {name; member} = person;
// ANCHOR_END: b

// ANCHOR: c
let {name = realName; member = groupMember} = person;
// ANCHOR_END: c















