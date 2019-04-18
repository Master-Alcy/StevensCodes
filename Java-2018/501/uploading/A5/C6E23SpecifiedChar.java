import javax.swing.JOptionPane;

/**
 * @author Jingxuan Ai
 * @date 2018/10/10
 */
public class C6E23SpecifiedChar {
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		pannel();
	}

	/** Asker in window */
	private static void pannel() {
		int option = JOptionPane.YES_OPTION;

		while (option == JOptionPane.YES_OPTION) {
			try {
				String aString = JOptionPane.showInputDialog(null,
						"Enter any non-Empty string", "Input(Outter)",
						JOptionPane.QUESTION_MESSAGE);
				isString(aString);

				while (option == JOptionPane.YES_OPTION) {
					try {
						String aChar = JOptionPane.showInputDialog(null,
								"Enter exact one character", "Input(Inner)",
								JOptionPane.QUESTION_MESSAGE);
						isChar(aChar);

						String str = "The number of '" + aChar + "' in \n\""
								+ aString + "\" \nis: "
								+ count(aString, aChar.charAt(0));

						option = JOptionPane.showConfirmDialog(null, str
								+ "   Contniue for new Char?", "Output(Inner)",
								JOptionPane.YES_NO_OPTION,
								JOptionPane.INFORMATION_MESSAGE);
					} catch (Exception e) {
						String errmsg = e.getMessage();
						if (errmsg == null) {
							errmsg = "";
						}
						String outputStr = errmsg + " Contniue for new Char?";
						option = JOptionPane.showConfirmDialog(null, outputStr,
								"Output(Inner)", JOptionPane.YES_NO_OPTION,
								JOptionPane.WARNING_MESSAGE);
					}
				}
				option = JOptionPane.YES_OPTION;

			} catch (Exception e) {
				String errmsg = e.getMessage();
				if (errmsg == null) {
					errmsg = "";
				}
				String outputStr = errmsg + " Continue?";
				option = JOptionPane.showConfirmDialog(null, outputStr,
						"Output(Outter)", JOptionPane.YES_NO_OPTION,
						JOptionPane.WARNING_MESSAGE);
			}
		}
	}

	/** Required count function */
	private static int count(String aString, char aChar) {
		int length = aString.length();
		if (length == 0) return 0; // must not contain aChar

		String[] strArr = aString.split("");
		String strTest = String.valueOf(aChar);
		int countOcc = 0;
		for (int i = 0; i < length; i++) {
			if (strArr[i].equals(strTest)) {
				countOcc++;
			}
		}
		return countOcc;
	}
	/**
	 * check if is a valid character
	 * @throws Exception
	 */
	private static void isChar(String aChar) throws Exception {
		if (aChar.length() != 1) {
			throw new Exception("Not a valid char. Need exact one char.");
		}
	}
	/**
	 * check if is a valid string
	 * @throws Exception
	 */
	private static void isString(String aString) throws Exception {
		if (aString.length() < 1) {
			throw new Exception("Not a valid string. Need at least one string.");
		}
	}
}