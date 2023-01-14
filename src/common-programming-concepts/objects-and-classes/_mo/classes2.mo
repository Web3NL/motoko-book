// CLASSES

// ANCHOR: a
class CryptoAccount(amount : Nat, multiplier : Nat) {
    public var balance = amount * multiplier;

    public func pay(amount : Nat) {
        balance += amount
    };
};

let account = CryptoAccount(10, 5);

account.pay(50);
// ANCHOR_END: a