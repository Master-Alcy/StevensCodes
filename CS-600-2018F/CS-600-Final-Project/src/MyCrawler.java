import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

/**
 * <h3>This Crawler used JSoup to operate</h3>
 * This is the only class need JSoup.
 */
public class MyCrawler {
	/**
	 * My Internet crawler.
	 * @param url Starting url.
	 * @param limit Limit of the total crawing urls.
	 */
	public static void crawler(String url, int limit) {
		ArrayList<String> pendingURLs = new ArrayList<>();
		ArrayList<String> visitedURLs = new ArrayList<>();
		pendingURLs.add(url);
		// pending not empty and visited <= 50
		while (!pendingURLs.isEmpty() && visitedURLs.size() < limit) {
			String currentURL = pendingURLs.remove(0);
			// check if visited already
			if (!visitedURLs.contains(currentURL)) {
				visitedURLs.add(currentURL);
				MyPrinter.ptln("Craw: " + currentURL);
				try {
					Document doc = Jsoup.connect(currentURL).get();
					String page = doc.text(); // Note this one has no HTML
					MyProcessor.process(page, currentURL);	// Inserting data
				} catch (IOException e) {
					MyPrinter.ptln("Error: " + e.getMessage());
				}
				// Populate pendingURLs
				for (String s : getSubURLs(currentURL)) {
					if (!visitedURLs.contains(s)) {
						pendingURLs.add(s);
					}
				}// End of populating from this subURL
			}
		}// End of while loop
		MyPrinter.ptln("----------- We visited " + visitedURLs.size()+ " URLs -----------");
		MyPrinter.ptln ("All data inserted by now. Begin searching: ");
	}
	
	/**
	 * Find all sub urls in web page
	 * @param currentURL The web we are looking at.
	 * @return The urls we found.
	 */
	private static ArrayList<String> getSubURLs(String currentURL) {
		ArrayList<String> list = new ArrayList<>();
		sub: while (true) {
			try {
				Document doc = Jsoup.connect(currentURL).get();
				Elements links = doc.select("a[href]");

				for (Element link : links) {
					list.add(link.absUrl("href"));
				}
				break;
			} catch (IOException e) {
				MyPrinter.ptln("Error: " + e.getMessage());
				break sub;
			}
		}
		return list;
	}
}
