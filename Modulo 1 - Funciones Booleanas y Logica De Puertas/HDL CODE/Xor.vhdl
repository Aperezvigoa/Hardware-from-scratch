// Xor Example

CHIP Xor {
    IN a, b;
    OUT out;

    PARTS:
    // Not A & Not B
    Nand(a= a, b= a, out= NotA);
    Nand(a= b, b= b, out= NotB);

    //  A And Not(B)
    Nand(a= a, b= NotB, out= NandANotB);
    Nand(a= NandANotB, b= NandANotB, out= aAndNotB);

    // Not(A) And B
    Nand(a= NotA, b= b, out= NandNotAb);
    Nand(a= NandNotAb, b= NandNotAb, out= NotaAndB);

    // (A And Not(B)) Or (Not(A) And B)
    Nand(a= aAndNotB, b= aAndNotB, out= NandaAndNotB);
    Nand(a= NotaAndB, b= NotaAndB, out= NandNotaAndB);
    Nand(a= NandaAndNotB, b= NandNotaAndB, out= out);
}
