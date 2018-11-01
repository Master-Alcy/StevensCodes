package three;

import static three.PrintT.pt;

//alt + shift + j auto generate /** */
//ctrl + d delete line
//ctrl + alt + arrow copy to
//alt + arrow move to
//ctrl + 1 show error reason
//ctrl + 2 change name claim variable
//ctrl + shift + r ?search
//alt + shift + z  generate possible codes
//ctrl + shift + l see all shorcuts
//shift + enter create a space line in next line
//ctrl + shift + enter ^^^ another direction
//alt + / show templates

/**
 * @author AiJingXuan
 */
public class Literals {
	/**
	 * @param args
	 */
	public static void main (String[] args) {
		
		int i1 = 0x2f;					// Hexadecimal (lower-case)
		pt(Integer.toBinaryString(i1));
		int i2 = 0x2F;					// Hexadecimal (upper-case)
		pt(Integer.toBinaryString(i2));
		/*
		 * 1 & 1 => 1, else => 0
		 * 1 | 0 => 1, 0 | 0 => 0;
		 * 1 ^ 0 ^ 1 => 1; 
		 * ^ one input is 1 but not all input is 1 then produce 1
		 * ~ 0 => 1, ~ 1 => 0
		 */
		pt("");
		int s1 = 0xaaaaaaaa;
		int s2 = 0x55555555;
		pt(Integer.toBinaryString(s1));
		pt(Integer.toBinaryString(s2));
		pt(Integer.toBinaryString(~s1));
		pt(Integer.toBinaryString(~s2));
		pt(Integer.toBinaryString(s1 & s1));
		pt(Integer.toBinaryString(s1 | s1));
		pt(Integer.toBinaryString(s1 ^ s1));
		pt(Integer.toBinaryString(s1 & s2));
		pt(Integer.toBinaryString(s1 | s2));
		pt(Integer.toBinaryString(s1 ^ s2));
	}
}
