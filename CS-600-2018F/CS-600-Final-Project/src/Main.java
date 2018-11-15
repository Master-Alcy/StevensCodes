import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		Asker();	
	}

	private static void Asker() {
		Scanner sc = new Scanner(System.in);	
		String url = "https://www.rainerhahnekamp.com/en/ignoring-exceptions-in-java/";
		int limit = 50;
		MyPrinter.ptln("Enter your url in line one and craw limt in line two.");
		MyPrinter.ptln("If you enter one \"0\" in first line you will enter default mode.");
		
		ask1: while(true) {
			String readURL = "";
			try {
				readURL = sc.nextLine();
				if (Integer.parseInt(readURL) == 0) {
					MyPrinter.ptln("Default URL: " + url);
					MyPrinter.ptln("Default craw limit: " + limit);
					break ask1;
				}
			} catch (Exception e1) {
				//do nothing
			}
			try {
				int readLimit = Integer.parseInt(sc.nextLine());
				url = readURL;
				limit = readLimit;
				MyPrinter.ptln("Your URL: " + url); 
				MyPrinter.ptln("Your craw limit: " + limit);
				break ask1;
			}catch(Exception e2) {
				sc.nextLine();
				MyPrinter.ptln("Error: " + e2.getMessage());
				MyPrinter.ptln("First line should be URL string or 0");
				MyPrinter.ptln("Second line should be craw limit. Ex: 30");
			}
		}// End of ask1 loop
		
		MyPrinter.ptln("~~~~~~~~~~~~~Craw and Data Insertion~~~~~~~~~~~~~~~~~");
		MyCrawler.crawler(url, limit);
		MyPrinter.ptln("~~~~~~~~Finished and Starting Search Engine~~~~~~~~~~");
		
		ask2: while(true) {
			MyPrinter.ptln("==============================================");
			MyPrinter.ptln("Enter search string in one line, and \"qqq\" to exit ");
			String searchString = "";
			try {
				searchString = sc.nextLine();
				if (searchString.equals("qqq")){
					break ask2;
				}
				String feedback = MyProcessor.searchEngine(searchString);
				MyPrinter.ptln(feedback);
			}catch(Exception e) {
				sc.nextLine();
				MyPrinter.ptln("Error: " + e.getMessage());
			}	
		}// End of ask2 loop
		sc.close();
		MyPrinter.ptln("Program fully exit.");
	}
}
