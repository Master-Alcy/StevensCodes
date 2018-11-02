import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.filechooser.FileNameExtensionFilter;

/**
 * @author Jingxuan Ai
 * @date 2018/10/11
 */
public class C12E13CountThingsInFile {
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
				// bring up inro
				option = JOptionPane.showConfirmDialog(null,
						"Choose the .txt file you want to open", "Intro",
						JOptionPane.YES_NO_OPTION,
						JOptionPane.INFORMATION_MESSAGE);
				if (option == JOptionPane.NO_OPTION){
					throw new Exception("No file chosen.");
				}

				// set up chooser and filter for .txt only
				JFileChooser chooser = new JFileChooser();
				FileNameExtensionFilter filter = new FileNameExtensionFilter(
						".txt files", "txt");
				chooser.setFileFilter(filter);

				// start from current dir
				File workingDirectory = new File(System.getProperty("user.dir"));
				chooser.setCurrentDirectory(workingDirectory);

				// open file select window
				chooser.setFileSelectionMode(JFileChooser.FILES_ONLY);
				int returnVal = chooser.showOpenDialog(null);

				// handle cancel and Esc button
				if (returnVal != JFileChooser.APPROVE_OPTION) {
					throw new Exception("No file chosen.");
				}

				// handle wrong or right file
				File selectedFile = chooser.getSelectedFile().getAbsoluteFile();
				String result = "";
				if (selectedFile.exists()) { 	//File Found
					result = processFile(selectedFile);	//buffer reader inside
				} else {	//Not there
					throw new Exception("File not found!");
				}
				
				//Print the result, ask if want to go on
				option = JOptionPane.showConfirmDialog(null, result, "Output",
						JOptionPane.YES_NO_OPTION,
						JOptionPane.INFORMATION_MESSAGE);

			} catch (Exception e) {
				//Print the Error, ask if want to go on
				String errmsg = e.getMessage();
				if (errmsg == null) {
					errmsg = "";
				}
				String outputStr = errmsg + " Continue?";
				option = JOptionPane.showConfirmDialog(null, outputStr,
						"Output", JOptionPane.YES_NO_OPTION,
						JOptionPane.WARNING_MESSAGE);
			}
		}
	}
	
	/** Process the text and return result in String @throws Exception */
	private static String processFile(File selectedFile) throws IOException {
		//Count the number of characters, words, and lines in a file. 
		//Words are separated by whitespace characters.
		BufferedReader br = new BufferedReader(new FileReader(selectedFile));
		int numChars = 0;
		int numWords = 0;
		int numLines = 0;
		String line = "";
		String wholeText = "";
		while((line = br.readLine()) != null) {
			numLines ++;		//numLines set
			wholeText += line;
		}
		br.close();
		//numChars set
		numChars = wholeText.length();
		//numWords set
		String testWords = wholeText.replaceAll("[^A-Za-z\\s]", "");
		testWords= testWords.trim().replaceAll(" +", " ");
		numWords = testWords.split("\\s").length;
		//result
		String result = "In file: " + selectedFile.getName() + " has:\n"+
		"numChars: " + numChars + " numWords: " + numWords + " numLines: " + numLines;
		//Definitions
		String setting = "If a Word is seperated by newLine, it would still be considered \n"
				+ "one word. NewLine is not considered a character. Word are defined as \n"
				+ "letters only (A-Z, a-z), numbers and symbols ignored. For example: \n"
				+ "\"a55__5W@o#r$d\" is considered \"aWord\", which is one words. However, \n"
				+ "\"a55 5W@o r$d\" is considered \"a Wo rd\", which is three words!\n\n";

		return setting + result;
	}
}