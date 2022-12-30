// PATTERN MATCHING

let individual = ("Male", 30);

let (gender, age) = individual;



// let (gender : Text, _ : Nat) = individual;



let person = {
    name = "Peter";
    member = false;
};

let {name; member} = person;



// let {name} = person;



let {name = realName; member = groupMember} = person;