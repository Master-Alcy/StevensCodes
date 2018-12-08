package test;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

/******************************************************************************
 *  Compilation:  javac StockQuote.java
 *  Execution:    java StockQuote symbol
 *  Dependencies: In.java, StdOut.java
 *
 *  Print the stock price of the stock with the given symbol.
 *  Screen scrapes http://finance.yahoo.com to get the current price
 *  and associated information.
 *
 *  Warning: if Yahoo updates the format of their page,
 *           this program also needs to be updated.
 *
 *  % java StockQuote GOOG
 *  744.0
 *  Alphabet Inc.
 *  Wed Jul 27 12:19:16 PDT 2016 
 *
 *  % java StockQuote AAPL
 *  103.78
 *  Apple Inc.
 *  Wed Jul 27 12:19:21 PDT 2016 
 * 
 *  % java StockQuote IBM
 *  162.29
 *  International Business Machines Corporation
 *  Wed Jul 27 12:19:26 PDT 2016 
 *
 *  % java StockQuote MSFT
 *  56.46
 *  Microsoft Corporation
 *  Wed Jul 27 12:19:30 PDT 2016 
 *
 ******************************************************************************/

public class StockQuote {

    // Given symbol, get HTML
    private static String readHTML(String symbol) {
    	Document doc = null;
		try {
			doc = Jsoup.connect("http://finance.yahoo.com/quote/" + symbol).get();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	String html = doc.html();
    	System.out.println("/////////////////////////////////////////////////////"
    			+ html + "//////////////////////////////////////////////////////");
        //In page = new In("http://finance.yahoo.com/quote/" + symbol);
        //String html = page.readAll();
        if (html.contains("<title></title>")) return null;
        else return html;
    }

    // Given symbol, get current stock price.
    public static double priceOf(String symbol) {
        String html = readHTML(symbol);
        int p     = html.indexOf("price.0", 0);      // "price.0" index
        int from  = html.indexOf(">", p);            // ">" index
        int to    = html.indexOf("</span>", from);   // "</span>" index
        String price = html.substring(from + 1, to);

        // remove any comma separators
        return Double.parseDouble(price.replaceAll(",", ""));
    }

    // Given symbol, get current stock price.
    public static double priceOf(String symbol, String html) {
        int p     = html.indexOf("price.0", 0);      // "price.0" index
        int from  = html.indexOf(">", p);            // ">" index
        int to    = html.indexOf("</span>", from);   // "</span>" index
        String price = html.substring(from + 1, to);

        // remove any comma separators
        return Double.parseDouble(price.replaceAll(",", ""));
    }

    // Given symbol, get current stock name.
    public static String nameOf(String symbol, String html) {
        int p    = html.indexOf("symbol.$companyName", 0);
        int from = html.indexOf(">", p);
        int to   = html.indexOf("</h6>", from);
        String name = html.substring(from + 1, to);
        return name;
    }

    // Given symbol, get current date.
    public static String dateOf(String symbol, String html) {
        int p    = html.indexOf("adx.bf1.yahoo.com", 0);
        int from = html.indexOf(" ", p);
        int to   = html.indexOf("-->", from);
        String date = html.substring(from + 1, to);
        return date;
    }


    public static void main(String[] args) {
        String symbol = "GOOG";
        String html = readHTML(symbol);
        if (html == null) System.out.println("Invalid symbol: " + symbol);
        else {
        	System.out.println(priceOf(symbol, html));
        	System.out.println(nameOf(symbol, html));
        	System.out.println(dateOf(symbol, html));
        }
    }

}