CHIP Or {
    IN a, b;
    OUT out;

    PARTS:
	Nand(a= a, b= a, out= aNanda);
	Nand(a= b, b= b, out= bNandb);
	Nand(a= aNanda, b= bNandb, out= out);
}
