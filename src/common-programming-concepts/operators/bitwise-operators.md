# Bitwise operators

## Bitwise And (&)

```motoko
let a : Nat8 = 10;     // # binary: 1010
let b : Nat8 = 6;      // # binary: 0110
let c : Nat8 = a & b;  // # binary: 0010 (decimal: 2)
assert c == 2;
```


## Bitwise Or (|)

```motoko
let a : Nat8 = 10;    // # binary: 1010
let b : Nat8 = 6;     // # binary: 0110
let c : Nat8 = a | b; // # binary: 1110 (decimal: 14)
assert c == 14;
```

## Bitwise Xor (^)

```motoko
let : Nat8 a = 10;     // # binary: 1010
let : Nat8 b = 6;      // # binary: 0110
let c : Nat8 = a ^ b;  //# binary: 1100 (decimal: 12)
assert c == 12;
```

## Bitwise Shift Left (<<)

```motoko
let a : Nat8 = 10;     //# binary: 1010
let b : Nat8 = a << 2; //# binary: 101000 (decimal: 40)
assert b == 40;
```

## Bitwise Shift Right (>>)

```motoko
let a : Nat8 = 10;     //# binary: 1010
let b : Nat8 = a >> 2; //# binary: 10 (decimal: 2)
assert b == 2;
```

## Bitwise Rotate Left (<<>)

```motoko 
let a : Nat8 = 10;       //# binary: 1010
let b : Nat8 = a << 2;   //# binary: 101000 (decimal: 40)
let c : Nat8 = (a << 2) | (a >> (4 - 2));  //# binary: 101010 (decimal: 42)
assert c == 42;
```


## Bitwise Rotate Right (<>>)

```motoko
let a : Nat8 = 10;       //# binary: 1010
let b : Nat8 = a >> 2;   //# binary: 10 (decimal: 2)
let c : Nat8 = (a >> 2) | (a << (4 - 2));  //# binary: 101010 (decimal: 42)
assert c == 42;
```

## Wrapping Addition (+%)

```motoko
let a : Int8 = 127; //# maximum value for a 8-bit signed integer
let b : Int8 = 1;
let c : Int8 = a +% b;      //# wraps around to -128
assert c == -128;
```


## Wrapping Subtraction (-%)

```motoko
let a : Int8 = -128; // # minimum value for a 8-bit signed integer
let b : Int8 = 1;
let c : Int8 = a -% b;       //# wraps around to 127
assert c == 127;
```

## Wrapping Multiplication (*%)

```motoko
let a : Int8 = 127; //# maximum value for a 8-bit signed integer
let b : Int8 = 2;
let c : Int8 = a *% b;     //# wraps around to -2
assert c == -2;
```

## Wrapping Exponentiation (**%)

```motoko
let a : Int8 = 2;
let b : Int8 = 8;
let c : Int8 = a **% b;    //# wraps around to 0
assert c == 0;
```
