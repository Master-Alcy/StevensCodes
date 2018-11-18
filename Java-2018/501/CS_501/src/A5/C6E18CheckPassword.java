package A5;

import javax.swing.JOptionPane;

/**
 * @author Jingxuan Ai
 * @date 2018/10/10
 */
public class C6E18CheckPassword {
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
				String password = JOptionPane
						.showInputDialog(
								null,
								"Enter password with at least eight characters "
										+ "\nand at least two digits. Letters and digits only.",
								"Check Password", JOptionPane.QUESTION_MESSAGE);

				if (!isValidPassowrd(password)) {
					throw new Exception("Invalid Password.");
				}

				option = JOptionPane.showConfirmDialog(null, "Valid Password.",
						"Continue or quit", JOptionPane.YES_NO_OPTION,
						JOptionPane.INFORMATION_MESSAGE);

			} catch (Exception e) {
				String errmsg = e.getMessage();
				if (errmsg == null) {
					errmsg = "";
				}
				String outputStr = errmsg + " Continue?";
				option = JOptionPane.showConfirmDialog(null, outputStr,
						"Continue or quit", JOptionPane.YES_NO_OPTION,
						JOptionPane.WARNING_MESSAGE);
			}
		}
	}

	/** Check if is valid password */
	private static boolean isValidPassowrd(String password) {
		int length = password.length();
		// at least eight characters
		if (length < 8) return false;
		// Letters and digits only.
		if (!password.matches("[A-Za-z0-9]+")) {
			return false;
		}

		String[] token = password.split("");
		int countDigit = 0;
		for (int i = 0; i < length; i++) {
			if (token[i].matches("[0-9]")) { // at least two digits
				countDigit++;
			}
		}
		// at least two digits
		if (countDigit < 2) return false;
		
		return true;
	}
}