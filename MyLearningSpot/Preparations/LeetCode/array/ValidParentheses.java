package array;

import java.util.Stack;

@SuppressWarnings("unused")
public class ValidParentheses {

	public static void main(String[] args) {
		ValidParentheses vp = new ValidParentheses();
		// boolean test = vp.isValid("(([])[{{}}]{[()]}{})");
		boolean test = vp.isValidX("(([])[{{}}]{[()]}{})");
		System.out.println(test);
	}
	
	/** Optimal 80.3%  5ms */
	private boolean isValidX(String s) {
		int N = s.length();
		char[] stack = new char[N];
		int topStack = 0;
		
		for (int i = 0; i < N; i++) {
			char c = s.charAt(i);
			switch (c) {
			case '(':
				stack[topStack ++] = ')';
				break;
			case '[':
				stack[topStack ++] = ']';
				break;
			case '{':
				stack[topStack ++] = '}';
				break;
			default:
				if (topStack == 0 || stack[-- topStack] != c) {
					return false;
				}
			}
		}
		return topStack == 0;
	}
	
	/** a new idea from discussion */
	private boolean isValid3(String s) {
		Stack<Character> stack = new Stack<>();
		
		for (char c : s.toCharArray()) {
			switch (c) {
			case '(':
				stack.push(')');
				break;
			case '[':
				stack.push(']');
				break;
			case '{':
				stack.push('}');
				break;
			default:
				if (stack.isEmpty() || stack.pop() != c) {
					return false;
				}
			}
		}
		return stack.isEmpty();
	}
	
	/** 33.5% 8ms */
	private boolean isValid2(String s) {
		int length = s.length();
		if (length == 0) {
			return true;
		} else if (length % 2 == 1) {
			return false;
		}
		Stack<Character> st = new Stack<>();
		
		for (int i = 0; i < length; i++) {
			char par = s.charAt(i);
			if (par == '(' || par == '[' || par == '{') {
				st.push(par);
			} else if (st.isEmpty()) {
				return false;
			} else {
				char test = findPair2(st.pop());
				if (par != test) {
					return false;
				} else if (i == length - 1) {
					return true;
				}
			}
		}// End of for loop

		return false;
	}
	
	private char findPair2(char str) {
		switch (str) {
		case '(':
			return ')';
		case '[':
			return ']';
		case '{':
			return '}';
		default:
			return ' ';
		}
	}

	/** first try 3.27% 24ms*/
	private boolean isValid(String s) {
		int length = s.length();
		if (length == 0) {
			return true;
		} else if (length % 2 == 1) {
			return false;
		}
		String[] tokens = s.split("");
		Stack<String> st = new Stack<>();

		for (int i = 0; i < length; i++) {
			String token = tokens[i];
			if (token.equals("(") || token.equals("[") || token.equals("{")) {
				st.push(token);
			} else {
				String test = "";
				try {
					test = st.pop();
				} catch (Exception ex) {
					return false;
				}
				if (token.equals(findPair(test))) {
					if (i == length - 1) {
						return true;
					}
				} else {
					return false;
				}
			}
		}
		return false;
	}

	private String findPair(String str) {
		switch (str) {
		case "(":
			return ")";
		case "[":
			return "]";
		case "{":
			return "}";
		default:
			return "";
		}
	}

}
