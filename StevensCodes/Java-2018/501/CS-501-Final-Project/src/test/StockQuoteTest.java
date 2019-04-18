package test;

import java.io.IOException;
import java.util.Arrays;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class StockQuoteTest {
	private static String readHTML(String symbol) {
		String page = "";
		String name = "";
		try {
			Document doc = Jsoup.connect(
					"https://finance.yahoo.com/quote/" + symbol + "/history?p=" + symbol
					).get();
			page = doc.select("table").text();
			
			name = doc.getElementsByAttributeValue("class", "D(ib) Fz(18px)").first().text();
			System.out.println(name);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		return page;
	}

	public static void main(String[] args) {
		String symbol = "AAPL";
		String html = readHTML(symbol);
		
		String[] tokens = html.substring(45, html.length() - 96).replaceAll(",", "").split(" ");
		
		for (int i = 0; i < tokens.length - 9; i += 9) {
			if (tokens[i + 4].equals("Dividend")) {
				i -= 4;
				continue;
			}
			String[] aRow = { tokens[i], tokens[i + 1], tokens[i + 2], tokens[i + 3], tokens[i + 4], tokens[i + 5],
					tokens[i + 6], tokens[i + 7], tokens[i + 8] };
			System.out.println(Arrays.toString(aRow));
		}

		//System.out.println(html);
		System.out.println("\nEND");
	}
}