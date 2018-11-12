import java.util.Iterator;
import java.util.Scanner;
import java.util.Set;

public class WebCrawler {

	public static void main(String[] args) {
		
		String url = "http://www.netinstructions.com/how-to-make-a-simple-web-crawler-in-java/";
		Spider spider = new Spider();
		spider.search(url);	
		
		String search_string = "";
		Scanner scanner = new Scanner(System.in);
		do {
			System.out.println("\nInput word you want to search :");
			search_string = scanner.nextLine();
			if (search_string.equals("exit")) {
				break;
			}
			Set<String> urls = SpiderLeg.searchForWord(search_string);
			Iterator<String> iterator = urls.iterator();
			System.out.println("Get URL: ");
			while (iterator.hasNext()) {
				System.out.println(iterator.next());
			}
			System.out.print("\n");
		} while (true);
		scanner.close();
		System.out.println("Complete");
	}
}
