actor {
// ANCHOR: a
stable let a1 : [var Nat] = [var 0, 1, 2];

stable var a2 : [var Text] = [var "t1", "t2", "t3"];
// ANCHOR_END: a

// ANCHOR: b
stable let r1 = { var x = 0 };

stable var r2 = { var x = 0; y = 1; };
// ANCHOR_END: b

// ANCHOR: c
stable let o1 = object { 
    public var x = 0;
    private var y = 0; 
};

stable var o2 = object { 
    public var x = 0;
    private var y = 0; 
};
// ANCHOR_END: c

// ANCHOR: d
stable let p1 = object { 
    private func f() {}; 
};

stable var p2 = object { 
    private func f() {}; 
};
// ANCHOR_END: d
}