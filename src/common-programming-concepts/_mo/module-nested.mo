// MODULES

// ANCHOR: a
// module-nested.mo
module {
    public module Person {
        public let name = "Peter";
        public let age = 20;
    };

    private module Info {
        public let city = "Amsterdam";
    };

    public let place = Info.city;
};
// ANCHOR_END: a
