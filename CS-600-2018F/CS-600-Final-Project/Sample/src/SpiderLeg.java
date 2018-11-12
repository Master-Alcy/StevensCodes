import java.io.IOException;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class SpiderLeg {
	private static final String USER_AGENT = "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/535.1 (KHTML, like Gecko) Chrome/13.0.782.112	Safari/535.1";
	private List<String> links = new LinkedList<String>();

	/*
	 * Give it an URL and it makes an HTTP request for a web page
	 */
	public void crawl(String Url){	
		try {
			Connection connection = Jsoup.connect(Url).userAgent(USER_AGENT);
			Document htmlDocument = connection.get();
			
			String page = htmlDocument.text(); 
			
			ProcessPage p = new ProcessPage();
			p.addPageWithUrl(page, Url);
			
			Elements linksOnPage = htmlDocument.select("a[href]");
				
			for(Element link : linksOnPage)
			{
				this.links.add(link.absUrl("href"));
			}
			
		} catch (IOException ioe) {
			// We were not successful in our HTTP request
			System.out.println("Error in out HTTP request " + ioe);
		}
	}
	
	public static Set<String> searchForWord(String line) {
		String[] words = line.split(" ");
		return searchWords(words);
	}
	
	public static Set<String> searchWords(String[] words) {
		Set<String>result = new HashSet<>();
		for (String word : words) {
			Set<String> wordResult = searchWord(word);
			if (wordResult != null) result.addAll(wordResult);
		}
		return result;
	}
	
	public static Set<String> searchWord(String searchWord){
	
		System.out.println("searching for the word "+"\""+ searchWord +"\""+ "...");
		
		char[] words = searchWord.toCharArray();
		Trie root = ProcessPage.trie;
		for (int i = 0; i < words.length; i++) {
			root = root.getChild(words[i]);
			if (root == null) return null;
		}
		return root.urls;
		
	}
	
	public List<String> getLinks(){
		return this.links;
	}
}
