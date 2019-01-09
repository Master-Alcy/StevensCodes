package string;


@SuppressWarnings("unused")
public class SubStringKMP {

	public static void main(String[] args) {
		int num = KMPsearch("abcd", "abcabcabcd");
		System.out.println(num);
	}

	/** Another approch of KMP, way too complex, hold */
	private class KMP {
		private final int R; // the radix
		private int[][] dfa; // deterministic finite-state automaton

		private char[] pattern; // either the character array for the pattern
		private String pat; // or the pattern string

		/**
		 * Pre-processes the pattern string.
		 * 
		 * @param pat the pattern string
		 */
		public KMP(String pat) {
			this.R = 256;
			this.pat = pat;
			// build DFA from pattern
			int m = pat.length();
			dfa = new int[R][m]; // row: ASCII, col: length of pattern
			// note char turn to number according to ASCII
			dfa[pat.charAt(0)][0] = 1; // for first character in pattern

			for (int x = 0, j = 1; j < m; j++) {
				for (int c = 0; c < R; c++)
					dfa[c][j] = dfa[c][x]; // Copy mismatch cases.
				dfa[pat.charAt(j)][j] = j + 1; // Set match case.
				x = dfa[pat.charAt(j)][x]; // Update restart state.
			}
		}

		/**
		 * Preprocesses the pattern string.
		 *
		 * @param pattern the pattern string
		 * @param R       the alphabet size
		 */
		public KMP(char[] pattern, int R) {
			this.R = R;
			this.pattern = new char[pattern.length];
			for (int j = 0; j < pattern.length; j++)
				this.pattern[j] = pattern[j];

			// build DFA from pattern
			int m = pattern.length;
			dfa = new int[R][m];
			dfa[pattern[0]][0] = 1;
			for (int x = 0, j = 1; j < m; j++) {
				for (int c = 0; c < R; c++)
					dfa[c][j] = dfa[c][x]; // Copy mismatch cases.
				dfa[pattern[j]][j] = j + 1; // Set match case.
				x = dfa[pattern[j]][x]; // Update restart state.
			}
		}

		/**
		 * Returns the index of the first occurrrence of the pattern string in the text
		 * string.
		 *
		 * @param txt the text string
		 * @return the index of the first occurrence of the pattern string in the text
		 *         string; N if no such match
		 */
		public int search(String txt) {

			// simulate operation of DFA on text
			int m = pat.length();
			int n = txt.length();
			int i, j;
			for (i = 0, j = 0; i < n && j < m; i++) {
				j = dfa[txt.charAt(i)][j];
			}
			if (j == m)
				return i - m; // found
			return n; // not found
		}

		/**
		 * Returns the index of the first occurrrence of the pattern string in the text
		 * string.
		 *
		 * @param text the text string
		 * @return the index of the first occurrence of the pattern string in the text
		 *         string; N if no such match
		 */
		public int search(char[] text) {

			// simulate operation of DFA on text
			int m = pattern.length;
			int n = text.length;
			int i, j;
			for (i = 0, j = 0; i < n && j < m; i++) {
				j = dfa[text[i]][j];
			}
			if (j == m)
				return i - m; // found
			return n; // not found
		}
	}

	/**
	 * KMP(Knuth-Morris-Pratt) substring search. Time: O(m + n) where m is the
	 * length of pattern, n is the length of text
	 */
	private static int KMPsearch(String pat, String txt) {
		int i = 0, j = 0;
		int patLen = pat.length();
		int txtLen = txt.length();
		int next[] = getNext(pat);

		while (i < txtLen && j < patLen) {
			if (j == -1 || txt.charAt(i) == pat.charAt(j)) {
				i++;
				j++;
			} else {
				j = next[j];
			}
		}
		if (j == patLen)
			return i - j;
		else
			return -1;
	}

	/**
	 * modified getNext, for case: text: abacababc, pattern: abab, for text[3] = c
	 * != pattern[3] = b, then it compares text[3] = c != pattern[1] = b, which is
	 * redundant. pattern[index] should not equals to pattern[next[index]]. Thus,
	 * need to turn next[index] to next[next[index]]
	 */
	private static int[] getNext(String pat) {
		int patLen = pat.length();
		int[] next = new int[patLen];
		next[0] = -1;
		int k = -1, j = 0;

		// For pat: abab, k = -1, j = 0
		// loop 1: k -> 0, j -> 1, ==> next[1] = 0
		// loop 2: k = next[0], k => -1
		// loop 3: k -> 0, j -> 2, ==> next[2] = next[0], next[2] = -1
		// loop 4: k -> 1, j -> 3, ==> next[3] = next[1], next[3] = 0
		// j = 3 !< 4 - 1, loop end
		// next: -1, 0, -1, 0
		while (j < patLen - 1) {
			// p[k] is prefix, p[j] is suffix
			if (k == -1 || pat.charAt(k) == pat.charAt(j)) {
				k++;
				j++;
				// Modify here
				if (pat.charAt(k) != pat.charAt(j))
					next[j] = k;
				else
					next[j] = next[k];
			} else {
				k = next[k];
			}
		}
		return next;
	}

	/** unmodified getNext */
	private static int[] getNext1(String pat) {
		int patLen = pat.length();
		int[] next = new int[patLen];
		next[0] = -1;
		int k = -1, j = 0;

		// For pattern: ABCABD, k = -1, j = 0
		// loop 1: k -> 0 and j -> 1, next[1] = 0
		// Note the difference between longest-same-array and next-array
		// loop 2: k = next[0], k -> -1
		// loop 3: k -> 0, j -> 2, next[2] = 0
		// loop 4: k = next[0], k -> -1
		// loop 5: k -> 0, j -> 3, next[3] = 0
		// loop 6: k -> 1, j -> 4, next[4] = 1
		// loop 7: k -> 2, j -> 5, next[5] = 2
		// loop 8: j = 5 < 6 - 1 => break loop
		// next: -1, 0, 0, 0, 1, 2
		while (j < patLen - 1) {
			// p[k] is prefix, p[j] is suffix
			if (k == -1 || pat.charAt(k) == pat.charAt(j)) {
				k++;
				j++;
				next[j] = k;
			} else {
				k = next[k];
			}
		}
		return next;
	}

	/** Brute-force, ~NM compares for pattern M text N in worst case. */
	private static int search(String pat, String txt) {
		int M = pat.length();
		int N = txt.length();

		for (int i = 0; i <= N - M; i++) {
			int j;

			for (j = 0; j < M; j++)
				if (txt.charAt(i + j) != pat.charAt(j))
					break;

			if (j == M)
				return i; // found
		}
		return N; // not found

		// explicit backup
//		int M = pat.length();
//		int N = txt.length();
//		int i, j;
//
//		for (i = 0, j = 0; i < N && j < M; i++) {
//			if (txt.charAt(i) == pat.charAt(j)) {
//				j++;
//			} else {
//				i -= j;
//				j = 0;
//			}
//		}
//		if (j == M)
//			return i - M; // found
//		else
//			return N; // not found
	}

}
