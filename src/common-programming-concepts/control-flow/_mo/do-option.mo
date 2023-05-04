// DO

//TEMP : shouldn't be the first or main example, but maybe good to showcase

// ANCHOR: a
func allergicToZero(number : ?Nat) : async ?Nat {
    do ? {
        let n = switch (number){
            case (null) null ! ;
            case (?0) null ! ;
            case (?n) n;      
        };
        let result = n * 5;
        result;
    };
};
// ANCHOR_END: a