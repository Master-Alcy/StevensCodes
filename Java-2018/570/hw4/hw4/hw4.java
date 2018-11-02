import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.regex.Pattern;

public class hw4 {	
	private static Node root;

	public static void main(String[] args) throws IOException {
		Scanner sc = new Scanner(System.in);
		String inputtext = "";
		root = new Node(' ');
		System.out.println("Companies' names should be stored in 'companies.dat' file."
				+ "\nCompanies' names should only contain [A-Z, a-z, 0-9]."
				+ "\nRelevance is counted as (total words of names)/(total words of article)."
				+ "\n(Ex: 'Apple Inc' counts as two words)."
				+ "\nInput article in ASCII only, whole line with one period to stop: \n");
		while(true){
			String input = sc.nextLine();
			if (input.equals(".")){
				System.out.println("\nProcess Started.");
				break;
			}
			inputtext += input + "\n";
		}
		sc.close();
		process(inputtext);
	}
	
	private static void process(String text) throws IOException {
		text = text.replaceAll("[^A-Za-z0-9\t\n\\s]+", "").replaceAll("[\t\n]+", " ");;
		String[] repwords = {"a", "an", "the", "and", "or", "but"};
		for (int i = 0; i < 6; i++){
			text = text.replaceAll(("\\b(?i)" + Pattern.quote(repwords[i]) + "\\b+"), "");
		}
		text = text.replaceAll("\\s+", " ");	

		BufferedReader br = new BufferedReader(new FileReader("companies.dat"));
		int numC = 1;
		int totwords = text.split("\\s").length;
		List<List<String[]>> nameWeight = new ArrayList<List<String[]>>();
		
		while (true) {
			String input = br.readLine();
			if (input == null){
				break;
			}
			
			String[] names = input.replaceAll("[^A-Za-z0-9\t\\s]+", "").split("\t");
			String[] matches = input.replaceAll("[^A-Za-z0-9\t\\s]+", "").replaceAll(" ", " ?").split("\t");		
			int size = names.length;		
			String[] keys = new String[size];
			nameWeight.add(new ArrayList<String[]>());
			
			for (int i = 0; i < size; i++) {
				keys[i] = names[i].replaceAll("\\s+", "");
				text = text.replaceAll(matches[i],keys[i]);
				nameWeight.get(numC - 1).add(new String[3]);
				nameWeight.get(numC - 1).get(i)[0] = names[i];
				nameWeight.get(numC - 1).get(i)[1] = Integer.toString(names[i].split("\\s").length);
				nameWeight.get(numC - 1).get(i)[2] = keys[i];
			}
			numC ++;
		}	
		
		String[] stext = text.split("\\s+");
		br.close();
		System.out.println("Finished reading companies.dat and input text.");
		trieProcess(stext, nameWeight,totwords);
	}

	private static void trieProcess(String[] stext,
			List<List<String[]>> nameWeight, double totwords) {
		
		for (int i = 0; i < stext.length; i++){
			insert(stext[i]);
		}		
		Map<String, Integer> map = new HashMap<String, Integer>();
	
		for (int i = 0; i < nameWeight.size(); i++) {	//loop different companies
			for (int j = 0; j < nameWeight.get(i).size(); j++) {	//loop a company's names
				
				String companyName = nameWeight.get(i).get(0)[0];
				String searchedKey = nameWeight.get(i).get(j)[2];
				int searchedKeyWeight = Integer.parseInt(nameWeight.get(i).get(j)[1]);
				int countKey = countWords(searchedKey);
				
				if (search(searchedKey) == true) {
					if (map.get(companyName) == null) {
						map.put(companyName, searchedKeyWeight * countKey);
					} else {
						map.put(companyName, map.get(companyName)
								+ searchedKeyWeight * countKey);
					}
				}
			}
		}
		
		System.out.println("Table generated:\n");
		StringBuilder sb = new StringBuilder();
		int nameCount = 0;
		sb.append(String.format("%-20s%-20s%-20s%n", "Company", "Hit Count", "Relevance"));
		for (Map.Entry<String,Integer> entry : map.entrySet()){
			sb.append(String.format("%-20s%-20s%-20s%n", entry.getKey(),
					entry.getValue(), fourdigits(entry.getValue()/totwords)));
			nameCount +=entry.getValue();	
		}
		sb.append(String.format("%-20s%-20s%-20s%n", "Total:", nameCount
				, fourdigits(nameCount/totwords)));
		sb.append(String.format("%-20s%-20s%n", "Total words:", (int)totwords));
		System.out.println(sb);
	}
	
	private static String fourdigits(double a){	
		if (a == 1){
			return "100.0%";
		}
		int tens = 0;
		a *= 10000;
		while (a < 1000){
			a *= 10;
			tens ++;
		}
		String b = (int)Math.round(a) + "";
		List<String> list = new ArrayList<String>();
		String result = "";
		for (int i = 0; i < 4; i++) {
			list.add(Character.toString(b.charAt(i)));
		}
		if (tens == 0 || tens == 1) {
			list.add(2 - tens, ".");
			list.add("%");
			for (int i = 0; i < 6; i++) {
				result += list.get(i);
			}
			return result;
		}else{
			list.add(0,".");
			list.add(0,"0");
			list.add("%");
			tens -= 2;
			while (tens != 0){
				list.add(2,"0");
				tens --;
			}
			for (int i = 0; i < list.size(); i++){
				result += list.get(i);
			}
			return result;
		}
	}

	private static void insert(String word){
		Node current = root;
		Node node;

		for (int i = 0; i < word.length(); i++) {
			node = current.subNode(word.charAt(i)); 
			if (node == null) {
				node = new Node(word.charAt(i));
				current.childList.add(node);
			}
			current = node;
		}
		current.isEnd = true;
		current.count++;
	}
	
	private static boolean search(String word) {
		Node current = root;
		Node node;
		
		for (int i = 0; i < word.length(); i++) {
			node = current.subNode(word.charAt(i));
			if (node == null) {
				return false;
			}
			current = node;
		}
		
		if (current.isEnd == true) {
			return true;
		} 
		return false;	
	}
	
	private static int countWords(String word) {
		Node current = root;
		
		for (int i = 0; i < word.length(); i++) {
			if (current.subNode(word.charAt(i)) == null) {
				return 0;
			}
			current = current.subNode(word.charAt(i));
		}
		return current.count;
	}
}

class Node{
	char data;
	boolean isEnd;
	int count;
	LinkedList<Node> childList;
	
	Node(char c){
		childList = new LinkedList<Node>();
		isEnd = false;
		data = c;
		count = 0;
	}
	
	Node subNode(char c){
		if (childList != null){
			for (Node eachChild : childList){
				if (eachChild.data == c){
					return eachChild;
				}
			}
		}
		return null;
	}
}