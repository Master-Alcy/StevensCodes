import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintStream;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Queue;


public class hmCode {

	public static void main(String[] args) throws IOException{	
		System.out.println("The infile.dat should in same path with source code.");
		System.out.println("The outfile.dat would generate in same path with source code.\n");
		String str = parseInput();	
		totalLength = str.length();
		Map<Character, Integer> baseMap = getTable(str);	
		HashMap<Character, Integer> sortedmap = processTable(baseMap);	
		HuffmanCode(sortedmap);
	}

	private static String parseInput() throws IOException {		//clean input text
		BufferedReader br = new BufferedReader(new FileReader("infile.dat"));
		StringBuilder SB = new StringBuilder();
		String line = null;
		String ls = System.getProperty("line.separator");
		while((line = br.readLine())!= null){
			SB.append(line);
			SB.append(ls);
		}
		SB.deleteCharAt(SB.length() - 1);
		String result = SB.toString();
		result = result.replaceAll("[^A-Za-z0-9]+", "");	
		br.close();
		return result;
	}

	private static Map<Character, Integer> getTable(String str2) {	//transfer string to map
		char[] c = str2.toCharArray();
		Map<Character, Integer> map = new HashMap<Character, Integer>();
		
		for (int i = 0; i < c.length; i++) {
			if(map.get(c[i]) == null){
				map.put(c[i], 1);
			}else{
				map.put(c[i], map.get(c[i])+1);
			}
		}
		return map;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private static HashMap<Character, Integer> processTable(Map<Character, Integer> baseMap2) {		//sort map
		List sortlist = new LinkedList(baseMap2.entrySet());
		Collections.sort(sortlist, new Comparator() {
			public int compare(Object o1, Object o2) {
				return ((Comparable) ((Map.Entry<Character, Integer>) (o1)).getValue())
						.compareTo(((Map.Entry<Character, Integer>) (o2)).getValue());
			}
		});
		HashMap<Character, Integer> sortedHashMap = new LinkedHashMap();
		for (Iterator it = sortlist.iterator(); it.hasNext();) {
			Map.Entry<Character, Integer> entry = (Map.Entry<Character, Integer>) it.next();
			sortedHashMap.put(entry.getKey(), entry.getValue());
		}
		return sortedHashMap;
	}
	
	private static void HuffmanCode(HashMap<Character, Integer> sortedmap) {	//process map into arrays with DESC order
		
		Map<Character, Integer> map = sortedmap;	
		int size = map.size();
		char[] keys = new char[size];
		int[] values = new int[size];	
		int index = 0;
		
		for (Entry<Character, Integer> mapEntry : map.entrySet()){
			keys[index] = mapEntry.getKey();
			values[index] = mapEntry.getValue();
			index++;
		}	
		continueHuffmanCode(keys, values, size);
	}

	private static void continueHuffmanCode(char[] keys, int[] values, int size) {	//generate Huffman code
		String[][] arr = new String[size][2];
		strarr = arr;
		counter = -1;
		Queue<Node> q1 = new LinkedList<Node>();
		Queue<Node> q2 = new LinkedList<Node>();
		Node temp, n1, n2;
		
		for (int i = 0; i < size; i++) {
			q1.add(new Node(keys[i], values[i]));
		}	
		while ((q1.size() + q2.size()) > 1){
			n1 = getmin(q1,q2);
			n2 = getmin(q1,q2);		
			temp = new Node('@', n1.weight + n2.weight);
			temp.left = n1;
			temp.right = n2;
			q2.add(temp);
		}	
		assignCode(q2.poll(), "");
		
		StringBuilder SB = new StringBuilder();
		int bits = 0;
		SB.append("Symbol" + "\t\t" + "Frequency" + "\t\t\t" + "Huffman Codes" + "\n");
		for (int i = size - 1; i >= 0; i--){
			SB.append(keys[i] + "\t\t" + (values[i] / totalLength) * 100 + "%"
					+ "\t\t" + fetchCode(keys[i], size) + "\n");
			bits += values[i] * fetchCode(keys[i], size).length();
		}
		SB.append("Total bits is: " + bits);
		System.out.println(SB);
		try {
			PrintStream out = new PrintStream(new FileOutputStream("outfile.dat"));
			out.print(SB);
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	static String[][] strarr;
	static int counter;
	static double totalLength;
	
	private static void assignCode(Node root, String str) {		//assgin code to keys
		if (root.equals(null)){
			return;
		}
		if (root.left == null && root.right == null){
			counter++;
			strarr[counter][0] = String.valueOf(root.name);
			strarr[counter][1] = str;
			return;
		}
		assignCode(root.left, str + "0");
		assignCode(root.right, str + "1");
	}
	
	private static String fetchCode(char name, int size) {	//get code according to keys
		String key = String.valueOf(name);
		for (int i = 0; i < size; i++){
			if (strarr[i][0].equals(key)){
				return strarr[i][1];
			}
		}
		return "error";
	}

	private static Node getmin(Queue<Node> q1, Queue<Node> q2){	//determing node with smaller value
		if (q1.isEmpty()){
			return q2.poll();
		}
		if (q2.isEmpty() || (q1.peek().weight < q2.peek().weight)){
			return q1.poll();
		}
		return q2.poll();	
	}
}

class Node {		
	int weight;
	char name;
	Node left;
	Node right;

	Node(char name, int weight) {
		this.weight = weight;
		this.name = name;
		left = right = null;
	}
}