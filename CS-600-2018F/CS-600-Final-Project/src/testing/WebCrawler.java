package testing;
import java.net.URL;
import java.util.ArrayList;
import java.util.Scanner;

public class WebCrawler {
	
	public static void crawler(String url) {
		ArrayList<String> listOfPendingURLs = new ArrayList<>();
		ArrayList<String> listOfTraversedURLs = new ArrayList<>();

		listOfPendingURLs.add(url);
		// while Pending URL not empty and traversed <= 50
		while (!listOfPendingURLs.isEmpty()
				&& listOfTraversedURLs.size() < 50) {
			// Get the first url
			String urlString = listOfPendingURLs.remove(0);
			// Check if traversed
			if (!listOfTraversedURLs.contains(urlString)) {
				listOfTraversedURLs.add(urlString);
				System.out.println("Craw " + urlString);

				for (String s : getSubURLs(urlString)) {
					// Populate pending
					if (!listOfTraversedURLs.contains(s)){
						listOfPendingURLs.add(s);						
					}
				}// End of for loop
			}
		}// End of while loop
		System.out.println("-------------"+ 
				"We visited " + listOfTraversedURLs.size() + " URLs"
				+"--------------");
	}
	
	/** Core function. Get sub URL */
	private static ArrayList<String> getSubURLs(String urlString) {
		ArrayList<String> list = new ArrayList<>();
		
		try {
			URL url = new URL(urlString);
			Scanner input = new Scanner(url.openStream());
			int current = 0;
			
			while (input.hasNext()){
				String line = input.nextLine();
				// Search for a URL: Start index?
				current = line.indexOf("http:", current);
				while (current > 0) {
					// Search for a URL: End index. URL ends with "
					int endIndex = line.indexOf("\"", current);
					// Ensure the correct URL is found
					if (endIndex > 0) {
						// URL extraction
						list.add(line.substring(current, endIndex));
						// search for a new URL
						current = line.indexOf("http:", endIndex);
					} else {
						current = -1;
					}
				}// End of inner loop
			}// End of outer loop
			input.close();
		}catch (Exception ex){
			System.out.println("Error: " + ex.getMessage());
		}
		return list;
	}
}
