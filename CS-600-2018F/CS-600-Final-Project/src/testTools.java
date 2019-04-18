
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.TreeMap;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

@SuppressWarnings("unused")
public class testTools {

	public static void main(String[] args) {
		//test0();
		test1();	
		//test2();
		//test3();
		//test4();
		//test5();
		//test6();
	}

	private static void test6() {
		HashMap<String, Integer> h1;
		HashMap<String, Integer> h2;
		HashMap<String, Integer> h3;
		HashMap<String, Integer> h4;
		//h1.put
	}

	private static void test5() {
		String ttt1 = "word";
		String ttt2 = "word and word";
		String ttt3 = " ";
		String ttt4 = "";
		String[] w1 = ttt1.split(" ");
		String[] w2 = ttt2.split(" ");
		String[] w3 = ttt3.split(" ");
		String[] w4 = ttt4.split(" ");
		System.out.println(Arrays.toString(w1));
		System.out.println(Arrays.toString(w2));
		System.out.println(Arrays.toString(w3));
		System.out.println(Arrays.toString(w4));
		System.out.println(w1.length);	// 1
		System.out.println(w1[0].isEmpty());
		System.out.println(w2.length);
		System.out.println(w3.length);	// 0
		System.out.println(w4.length);	// 1
		System.out.println(w4[0].isEmpty());	// true
	}

	private static void test4() {
		MyPrinter.ptln(1);
		MyPrinter.ptln("2222222222222222222");
		MyPrinter.ptln(1111111111);
		MyPrinter.ptln("asdasdasd asdas");
		MyPrinter.ptln("aaaaaaaaaaa\naaaaaaaaaaaaaa\naaaaaaaaaaa");
		// This one can't print \n in file
		MyPrinter.ptln("-----------------------------------------");
	}

	private static void test3() {
		String x = "pabout about aboutp about about ABout abOUT ABOUT abcde";
		System.out.println(x);
		x = x.replaceAll(("\\b(?i)" + Pattern.quote("about") + "\\b+"), " ");
		System.out.println(x);
	}

	private static void test2() {
		String text = ".asas  @@@#$%  sdaAAAAAAAaaas.";
		text = text.replaceAll("[^A-Za-z\\s]+"," ");
		System.out.println(text);
		text = text.replaceAll("\\s+", " ").trim().toLowerCase();
		System.out.println(text);
		String[] k = text.split(" ");
		System.out.println(Arrays.toString(k));
		
	}

	private static void test1() {
		MyCompressedTrie trie = new MyCompressedTrie();
		trie.insert("for","www.aaa.com");
		trie.insert("do","www.aaa.com");
		trie.insert("doing","www.aaa.com");
		trie.insert("facebook","www.aaa.com");
		trie.insert("face","www.aaa.com");
		trie.insert("there","www.aaa.com");
		trie.insert("this","www.aaa.com");
		trie.insert("whatafter","www.aaa.com");
		trie.insert("whatin","www.aaa.com");
		trie.insert("wheat","www.aaa.com");
		
		trie.insert("for","www.aaa.com");
		trie.insert("do","www.aaa.com");
		trie.insert("doing","www.aaa.com");
		trie.insert("facebook","www.aaa.com");
		trie.insert("face","www.aaa.com");
		trie.insert("there","www.aaa.com");
		trie.insert("this","www.aaa.com");
		trie.insert("whatafter","www.aaa.com");
		trie.insert("whatin","www.aaa.com");
		trie.insert("wheat","www.aaa.com");
		
		trie.insert("for","www.bbb.com");
		trie.insert("do","www.bbb.com");
		trie.insert("doing","www.bbb.com");
		trie.insert("facebook","www.bbb.com");
		trie.insert("face","www.bbb.com");
		trie.insert("there","www.bbb.com");
		trie.insert("this","www.bbb.com");
		trie.insert("whatafter","www.bbb.com");
		trie.insert("whatin","www.bbb.com");
		trie.insert("wheat","www.bbb.com");	
		
		trie.insert("for","www.ccc.com");
		trie.insert("for","www.ccc.com");
		trie.insert("for","www.ccc.com");
		trie.insert("for","www.ccc.com");
		trie.insert("for","www.ccc.com");
		trie.insert("for","www.ccc.com");
		
		HashMap<String,Integer> h1 = trie.get("for");
		HashMap<String,Integer> h2 = trie.get("do");
		HashMap<String,Integer> h3 = trie.get("doing");
		HashMap<String,Integer> h4 = trie.get("facebook");
		HashMap<String,Integer> h5 = trie.get("face");
		HashMap<String,Integer> h6 = trie.get("there");
		HashMap<String,Integer> h7 = trie.get("this");
		HashMap<String,Integer> h8 = trie.get("whatafter");
		HashMap<String,Integer> h9 = trie.get("whatin");
		HashMap<String,Integer> h10 = trie.get("wheat");
		
		
		System.out.println("for: " + h1.entrySet().toString());
		System.out.println("do: " + h2.entrySet().toString());
		System.out.println("doing: " + h3.entrySet().toString());
		System.out.println("facebook: " + h4.entrySet().toString());
		System.out.println("face: " + h5.entrySet().toString());
		System.out.println("there: " + h6.entrySet().toString());
		System.out.println("this: " + h7.entrySet().toString());
		System.out.println("whatafter: " + h8.entrySet().toString());
		System.out.println("whatin: " + h9.entrySet().toString());
		System.out.println("wheat: " + h10.entrySet().toString());	
		
		System.out.println("------------------------------------");
		HashMap<String, Integer> allMap = new HashMap<>();	
		
		Iterator<Entry<String, Integer>> iter = h1.entrySet().iterator();
		while (iter.hasNext()){
			Entry<String,Integer> entry = (Entry<String, Integer>) iter.next();
			String url = entry.getKey();
			Integer occurence = entry.getValue();
			allMap.merge(url, occurence, (value, newValue) -> value + occurence); 
		}
		iter = h2.entrySet().iterator();
		while (iter.hasNext()){
			Entry<String,Integer> entry = (Entry<String, Integer>) iter.next();
			String url = entry.getKey();
			Integer occurence = entry.getValue();
			allMap.merge(url, occurence, (value, newValue) -> value + occurence); 
		}
		iter = h3.entrySet().iterator();
		while (iter.hasNext()){
			Entry<String,Integer> entry = (Entry<String, Integer>) iter.next();
			String url = entry.getKey();
			Integer occurence = entry.getValue();
			allMap.merge(url, occurence, (value, newValue) -> value + occurence); 
		}
		iter = h4.entrySet().iterator();
		while (iter.hasNext()){
			Entry<String,Integer> entry = (Entry<String, Integer>) iter.next();
			String url = entry.getKey();
			Integer occurence = entry.getValue();
			allMap.merge(url, occurence, (value, newValue) -> value + occurence); 
		}
		TreeMap<String, Integer> sortedTree = MyTreeMapByValue.sortValue(allMap);
		System.out.println("AllMap for (for,do,doing,facebook)");
		System.out.println(allMap.entrySet().toString());
		System.out.println(sortedTree.entrySet().toString());
	}

	private static void test0() {	
		try {
			String url = "http://www.math.odu.edu/~bogacki/cgi-bin/lat.cgi#bottom";
			
			//load doc
			Document doc = Jsoup.connect(url).get();	
			//String title = doc.title();
			System.out.println("~~~~~~~~~~~~~~~~~~~~111~~~~~~~~~~~~~~~~~\n");
			System.out.println(doc);
			//doc.clearAttributes();
			
			// Test parse
			doc = Jsoup.parse(doc.toString());
			System.out.println("~~~~~~~~~~~~~~~~~~~~~222~~~~~~~~~~~~~~~~\n");
			System.out.println(doc);
			
			//get all text within pages without html tags
			System.out.println("~~~~~~~~~~~~~~~~~~~~~333~~~~~~~~~~~~~~~~\n");
			String page = doc.text();
			System.out.println(page);
			
			// Try get a link
			System.out.println("~~~~~~~~~~~~~~~~~~~~~444~~~~~~~~~~~~~~~~\n");
			Elements links = doc.select("a[href]");
			
			for (Element link : links){
				System.out.println(link.absUrl("href"));
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		//System.out.println(('a' + 25) == 'z' );
		System.out.println('t' - 'a' );
		StringBuilder[] sb = new StringBuilder[10];
		System.out.println(sb);	//memory address
		System.out.println(sb[0]);	//null
		System.out.println(sb[9]);	//null
		//System.out.println(sb[-1]);	//exception
		
		int i = 0;
		while(i < 3){
			i++;
		}
		System.out.println(i);
	}
}
