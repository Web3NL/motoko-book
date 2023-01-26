// GENERICS

// ANCHOR: a
type Result<Ok, Err> = {
    #ok : Ok; 
    #err : Err;
};
// ANCHOR_END: a

// ANCHOR: b
type UsernameError = {
    #TooShort;
    #TooLong;
};

type UsernameCheck = Result<(), UsernameError>;
// ANCHOR_END: b

// ANCHOR: b
func checkUsername( name : Text ) : UsernameCheck {
    let size = name.size();
    if (size < 4) #err(#TooShort)
    else if (size > 20) #err(#TooLong)
    else #ok()
};
// ANCHOR_END: b
