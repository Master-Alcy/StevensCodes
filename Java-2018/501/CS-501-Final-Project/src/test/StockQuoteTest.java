package test;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class StockQuoteTest {
	private static String readHTML(String symbol) {
		String page = "";
		try {
			Document doc = Jsoup.connect(
					"https://finance.yahoo.com/quote/" + symbol + "/history?p=" + symbol
					).get();
			page = doc.select("table").text();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return page;
	}

	public static void main(String[] args) {
		String symbol = "GOOG";
		String html = readHTML(symbol);

		System.out.println(html);
		System.out.println("\nEND");
	}
}