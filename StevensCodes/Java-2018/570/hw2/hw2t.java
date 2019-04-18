import java.util.Scanner;
import java.util.Stack;

public class hw2t {
	static Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {
		System.out.println("RPN calculator.");
		while(true){
			String postfix = "";
			System.out.println("Input infix math problem in one line('quit' to exit)."
					+ "\nnumbers and operators should be seperated by one space:");
			String input = sc.nextLine();
			if (input.equals("quit")){
				System.out.println("Calculator exit.");
				System.exit(0);
			}
			postfix = inputconvert(input);
			System.out.println("Postfix: " + postfix);
			System.out.println("The Answer is: " + calcresult(postfix) + "\n");
		}
	}
	//infix: ( 3.1 + 4.2 / 2.3 ) * ( 5.4 * 3.5 - 6.6 ) - 8.7 POW 9.8
    //postfix: 3.1 4.2 2.3 / + 5.4 3.5 * 6.6 - * 8.7 9.8 POW -
	private static String inputconvert(String infix) {
		String postfix = new String("");
		System.out.println("Infix: " + infix);
		infix = infix.replaceAll("\\(", "p").replaceAll("\\)", "q");
		Stack<String> stack = new Stack<String>();		
		String[] tokens = infix.split("\\s+");
		
		for (int i = 0; i < tokens.length; i++) {
			if (isNumeric(tokens[i])) {
				postfix += tokens[i] + " ";
			} else if (tokens[i].equals("p")) {
				stack.push(tokens[i]);
			} else if (tokens[i].equals("q")) {
				while (!stack.isEmpty() && !stack.peek().equals("p")) {
					postfix += stack.pop() + " ";
				}
				if (!stack.isEmpty() && !stack.peek().equals("p")) {
					return "Invalid";
				} else {
					stack.pop();
				}
			} else{
				while (!stack.isEmpty() && priority(tokens[i]) <= priority(stack.peek())) {
					postfix += stack.pop() + " ";
				}
			stack.push(tokens[i]);
			}
		}
		while (!stack.isEmpty()){
			postfix += stack.pop() + " ";
		}	
		return postfix;
	}
	
	private static boolean isNumeric(String str){
		try{
			double d = Double.parseDouble(str);
		}catch(NumberFormatException nfe){
			return false;
		}
		return true;
	}
	
	private static int priority(String str){
		switch(str){
		case "+": return 1;
		case "-": return 1;
		case "*": return 2;
		case "/": return 2;
		case "%": return 2;
		case "POW": return 3;
		}
		return -1;
	}
	
	private static double calcresult(String postfix) {
		String[] tokens  = postfix.split("\\s+");
		String tok = "";
		Stack<Double> result = new Stack<Double>();
		
		for (int i=0; i<tokens.length; i++){
			 tok = tokens[i];
			 switch(tok){
			 case "+":
				 result.push(result.pop() + result.pop());
                 break;
             case "-":
            	 result.push(- result.pop() + result.pop());
                 break;
             case "*":
            	 result.push(result.pop() * result.pop());
                 break;
             case "/":
            	 double divisor = result.pop();
            	 try {            
                 if (divisor == 0){
                	 throw new ArithmeticException();
                 }
            	 }catch(ArithmeticException ae){
            		 System.out.println("Divide-by-zero occured!");
            	 }
                 result.push(result.pop() / divisor);
                 break;
             case "%":
            	 double modder = result.pop();
            	 result.push(result.pop() % modder);
            	 break;
             case "POW":
                 double exponent = result.pop();
                 result.push(Math.pow(result.pop(), exponent));
                 break;
             default:
            	 result.push(Double.parseDouble(tok));
                 break;
			 }
		}
		if (result.peek().isNaN()){
			System.out.println("NaN occured!");
		}
		return result.peek();
	}
}