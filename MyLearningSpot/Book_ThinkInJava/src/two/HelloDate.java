package two;

//:path/HelloDate.java

import java.util.Date;
/**
 * @see classname
 * {@docRoot}
 * {@inheritDoc}
 * @version version-information
 * @author aijin
 *
 */

/**
 * Describe what is this program about
 * 
 * @author aijin
 * @author www.aijing.com
 * @version 4.0
 */
public class HelloDate {	
	/**Entry point.
	 * @param args array of string arguments
	 * @throws exceptions No exception thrown
	 */
	
	/**@param HelloDate-main trying javadoc
	 * 
	 * @param args
	 * 
	 * @return trying this
	 * 
	 * @throws HelloDate this is description
	 */
	
	public static void main(String[] args) {
		/**field comment*/
		//int a = 1;
		TestStatic.i ++;
		/**method comment*/
		Increase.inc();
		System.out.println(TestStatic.i);
		System.out.println("Hello, it's " + new Date());
		Date d = new Date();
		System.out.println(d); 
		System.getProperties().list(System.out);
		System.out.println("\n\n" + System.getProperty("user.name"));
		System.out.println(System.getProperty("java.library.path"));
		AllTheColorsOfTheRainbow aww = new AllTheColorsOfTheRainbow();
		aww.changeTheHueOfTheColor(255);
		System.out.println(aww.anInteherRepresentingColors);
	}
}/*Output: (55% match)
.......
*///:~

//class name Caps ex: class AllTheColorsOfTheRainbow{} no "_"
class AllTheColorsOfTheRainbow {
	int anInteherRepresentingColors;	//else names same except first letter lower-case
	void changeTheHueOfTheColor(int newHue) {
		anInteherRepresentingColors = newHue;
	}
}