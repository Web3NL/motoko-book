// MODULES

// ANCHOR: a
// MyClass.mo
module {
    public class MyClass(x : Nat) {
        private let start = x**2;
        private var counter = 0;

        public func addOne() {
            counter += 1
        };

        public func getCurrent() : Nat {
            counter
        }; 
    };
}
// ANCHOR_END: a