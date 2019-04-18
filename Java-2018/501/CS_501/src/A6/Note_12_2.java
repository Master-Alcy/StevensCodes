package A6;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Scanner;

public class Note_12_2 {

	public static void main(String[] args) {
		try {
			URL url = new URL("http://www.google.com/index.html");
			// URL url2 = new URL("www.google.com/index.html");
			// ^This is wrong
			Scanner input = new Scanner(url.openStream());
			int count = 0;
			while (input.hasNext()){
				String line = input.nextLine();
				count += line.length();
			}
			System.out.println("The file size is " + count + " characters");
			input.close();
		}catch(MalformedURLException ex) {
			System.out.println("Invalid URL");
			ex.printStackTrace();
		}catch(IOException ex){
			System.out.println("I/O: No such file");
			ex.printStackTrace();
		}
	}
}