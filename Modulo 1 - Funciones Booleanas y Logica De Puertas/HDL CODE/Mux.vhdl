CHIP Mux {
    IN a, b, sel;
    OUT out;

    PARTS:
	// (Not(sel) And A)
	Nand(a= sel, b= sel, out= Notsel);
	Nand(a= Notsel, b= a, out= NandNotSelA);
	
	Nand(a= NandNotSelA, b= NandNotSelA, out= NotSelAndA);

	// (sel And b)
	Nand(a= b, b= sel, out= NandBSel);
	Nand(a= NandBSel, b= NandBSel, out= SelAndB);

	// Creating the Or
	Nand(a= NotSelAndA, b= NotSelAndA, out= NandNotSelAndA);
	Nand(a= SelAndB, b= SelAndB, out= NandSelAndB);

	Nand(a= NandNotSelAndA, b= NandSelAndB, out= out);
}
