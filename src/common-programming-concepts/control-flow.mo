//  CONTROL FLOW

let condition = true;

var number = 0;

if (condition) { number += 1};

// number is now 1

if (condition) {} else {};

let result : Text = if (condition) {
    "condition was true"
} else {
    "condition was false"
};

switch (condition) {
    case (a) {};
};

type Color = { #Black; #White; #Blue; };

let color : Color = #Black;

var count = 0;

switch (color) {
    case (#Black) { count += 1 };
    case (#White) { count-= 1 };
    case (#Blue) { count := 0 };
};


