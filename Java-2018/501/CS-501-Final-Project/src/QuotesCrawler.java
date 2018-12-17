import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class QuotesCrawler {
	private static String name = "";

	public static void main(String[] args) {	// Test
		// operateSymbol("GOOG");
		operateSymbol("AAPL");
	}

	/** The purpose is to add data to existing database */
	public static void operateSymbol(String symbol) {
		String rawData = readSymbol(symbol);
		ArrayList<String[]> processedData = processData(rawData);
		addToDatabase(processedData, name, symbol);
	}

	/** Insert data. Note that the table must have been created already. */
	private static void addToDatabase(ArrayList<String[]> dataList, String thisName, String symbol) {
		DataBase.UserInsertData(dataList, thisName, symbol);
	}

	/** Turn the data into acceptable form */
	private static ArrayList<String[]> processData(String data) {
		String[] tokens = data.substring(45, data.length() - 96).replaceAll(",", "").split(" ");
		ArrayList<String[]> allRows = new ArrayList<>();

		for (int i = 0; i < tokens.length - 9; i += 9) {
			if (tokens[i + 4].equals("Dividend")) {
				i -= 4;
				continue;
			}
			String[] aRow = { tokens[i], tokens[i + 1], tokens[i + 2], tokens[i + 3], tokens[i + 4], tokens[i + 5],
					tokens[i + 6], tokens[i + 7], tokens[i + 8] };
			allRows.add(aRow);
		}
		return allRows;
	}

	/** This one is to get data from yahoo.finance */
	private static String readSymbol(String symbol) {
		String page = "";
		try {
			Document doc = Jsoup.connect("https://finance.yahoo.com/quote/" + symbol + "/history?p=" + symbol).get();
			page = doc.select("table").text();
			name = doc.getElementsByAttributeValue("class", "D(ib) Fz(18px)").first().text();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return page;
	}
}
