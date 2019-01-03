package chapter1;

import java.util.Iterator;
import java.util.Stack;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Note_4 {

	public static void main(String[] args) {
		String s = "1100e10a";
		
		Pattern p = Pattern.compile("[^0-9e]");	//Wrong pattern
		Matcher m = p.matcher(s);
		if (m.find()){
			System.out.println("Wrong.");
		}else{
			System.out.println("Correct.");	
		}
		
		// Iteration
		Stack<String> stack = new Stack<>();
		stack.push("1");
		stack.push("2");
		stack.push("3");
		for (String s1 : stack){
			System.out.println(s1);	
		}
		// Same as:
		Iterator<String> i = stack.iterator();
		while(i.hasNext()){
			System.out.println(i.next());	
		}
		/** The use of iterator free us to switch to a totally
		 * different representation without having to change
		 * any client code. Also allows clients to use iteration
		 * without having to know any details of the class implementation 
		 */
		/** A good example would be Algorithm 1.1 */
	}

}
