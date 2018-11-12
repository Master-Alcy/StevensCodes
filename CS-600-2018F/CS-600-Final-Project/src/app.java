import java.util.Scanner;

public class app {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);	
		//System.out.print("Enter a URL: ");
		// https://algs4.cs.princeton.edu/code/
		//String url = sc.nextLine();
		// Traverse 50 Webs from the a starting URL
		String url = "https://algs4.cs.princeton.edu/code/";
		WebCrawler.crawler(url);
	}

}
