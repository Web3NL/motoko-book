# Bitwise operators
Bitwise operators are used to manipulate the *bits* of number values. 

## Bitwise AND `&`
```motoko
let a : Nat8 = 10;     //  binary: 0000_1010
let b : Nat8 = 6;      //  binary: 0000_0110
let c : Nat8 = a & b;  //  binary: 0010 (decimal: 2)
assert c == 2;
```


## Bitwise OR `|`
```motoko
let a : Nat8 = 10;    //  binary: 0000_1010
let b : Nat8 = 6;     //  binary: 0000_0110
let c : Nat8 = a | b; //  binary: 0000_1110 (decimal: 14)
assert c == 14;
```

## Bitwise XOR `^`
```motoko
let : Nat8 a = 10;     //  binary: 0000_1010
let : Nat8 b = 6;      //  binary: 0000_0110
let c : Nat8 = a ^ b;  //  binary: 0000_1100 (decimal: 12)
assert c == 12;
```

## Bitwise Shift Left `<<`
```motoko
let a : Nat8 = 10;     //  binary: 0000_1010
let b : Nat8 = a << 2; //  binary: 0010_1000 (decimal: 40)
assert b == 40;
```

## Bitwise Shift Right `>>`
```motoko
let a : Nat8 = 10;     //  binary: 0000_1010
let b : Nat8 = a >> 2; //  binary: 0000_0010 (decimal: 2)
assert b == 2;
```

## Bitwise Rotate Left `<<>`
```motoko 
let a : Nat8 = 10;       //  binary: 0000_1010
let b : Nat8 = a <<> 2;  //  binary: 0010_1000 (decimal: 40)
assert b == 40;
```

## Bitwise Rotate Right `<>>`
```motoko
let a : Nat8 = 10;       //  binary: 0000_1010
let b : Nat8 = a >> 2;   //  binary: 1000_0010 (decimal: 130)
assert b == 130;
```

## Wrapping Addition `+%`
```motoko
let a : Int8 = 127;     // maximum value for a 8-bit signed integer
let b : Int8 = 1;
let c : Int8 = a +% b;  // wraps around to -128
assert c == -128;
```

## Wrapping Subtraction `-%`
```motoko
let a : Int8 = -128;    // minimum value for a 8-bit signed integer
let b : Int8 = 1;
let c : Int8 = a -% b;  // wraps around to 127
assert c == 127;
```

## Wrapping Multiplication `*%`
```motoko
let a : Nat = 2;
let b : Nat = 128;
let c : Nat = a *% b;   // wraps around to 0
assert c == 0;
```

## Wrapping Exponentiation `**%`
```motoko
let a : Nat = 2;
let b : Nat = 8;
let c : Nat = a **% b;  // wraps around to 0
assert c == 0;
```
