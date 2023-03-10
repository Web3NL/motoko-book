# Text concatenation

## Text operator
Checkout the chapter on [functions](functions.html) to see an example of the text concatenation operator `#`.


```motoko
let array : [Text] = ["ICP", "is", "a", "blockchain"];

let sentance : Text = array[0] # " " # array[1] # " " # array[2] # " " # array[3];

assert sentance == "ICP is a blockchain"

```
