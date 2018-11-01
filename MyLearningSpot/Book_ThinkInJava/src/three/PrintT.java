package three;

public class PrintT {

	public static void pt(Object str) {
		try {
			System.out.println(str + "");
		} catch (Exception e) {
			System.out.println("Error. Wrong Print Type.");
			e.printStackTrace();
			return;
		}
	}
}