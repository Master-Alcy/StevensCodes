package A4;

import java.util.GregorianCalendar;

/**
 * @author Jingxuan Ai
 * @date 2018/10/6
 */
public class C9E5Gregorian {
	/**
	 * @param args
	 *            Answers in main
	 */
	public static void main(String[] args) {
		GregorianCalendar g1 = new GregorianCalendar();
		ptln("The current Year/Month/Day is: " + g1.get(GregorianCalendar.YEAR)
				+ "/" + (g1.get(GregorianCalendar.MONTH) + 1) + "/"
				+ g1.get(GregorianCalendar.DAY_OF_MONTH));
		g1.setTimeInMillis(1234567898765L);
		ptln("The setTimeInMillis's Year/Month/Day is: "
				+ g1.get(GregorianCalendar.YEAR) + "/"
				+ (g1.get(GregorianCalendar.MONTH) + 1) + "/"
				+ g1.get(GregorianCalendar.DAY_OF_MONTH));
	}

	/** my personal printer */
	private static void ptln(Object str) {
		try {
			System.out.println(str + "");
		} catch (Exception e) {
			System.out.println("Error. Wrong Print Type.");
			e.printStackTrace();
			return;
		}
	}
}