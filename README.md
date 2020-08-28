# ChessPuzzle
https://www.youtube.com/watch?v=as7Gkm7Y7h4

The trick on the 2k×2k board is to associate each of the 22k squares with a unique binary number with 2k bits. (Note that the number of squares equals the number of such binary labels, so that there indeed exists a bijection).

Let y denote the binary label of the square picked by P from the audience.
Consider the checkerboard at the moment just after P has flipped his coin, and consider the binary labels of all the squares with a white piece. Let z denote the XOR of all such white binary labels; hence z is another binary number with 2k bits.
Your goal is to flip a piece, so that afterwards the XOR of all white binary labels becomes equal to y.
Mathematically, you would like to find a square whose binary label x satisfies x⊕z=y.
Since the operation ⊕ is associative, and since z⊕z=0 and z⊕0=z for all z, this desired equation x⊕z=y is equivalent to x⊕z⊕z=y⊕z and furthermore to x=y⊕z.
Hence if we simply flip the square with binary label y⊕z, our partner will compute the XOR of all white binary labels and then announce the corresponding square to the audience. Done.
