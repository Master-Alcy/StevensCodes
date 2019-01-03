package NewQuestions;

import java.util.Stack;

@SuppressWarnings("unused")
public class ValidParentheses {

	public static void main(String[] args) {
		ValidParentheses vp = new ValidParentheses();
		//boolean test = vp.isValid("(([])[{{}}]{[()]}{})");
		boolean test = vp.isValid2("((");
		System.out.println(test);
	}

	private boolean isValid2(String s) {
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
			} else { // Even number of inputs. Consider: {(})
				String test;
				try {
					test = st.pop();
				} catch (Exception ex) {
					return false;
				}
				if (!token.equals(findPair(test))) {
					return false;
				}
			}
		}
		return true;
	}

	/** first try */
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
