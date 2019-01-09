package a_NewQuestions;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@SuppressWarnings("unused")
public class LongestSubstringWithoutRepeatingCharacters {

	public static void main(String[] args) {
		LongestSubstringWithoutRepeatingCharacters lo = new LongestSubstringWithoutRepeatingCharacters();
		int len = lo.lengthOfLongestSubstring2("pwwkew");
		System.out.println(len);
	}
	
	/** Kadane's Optimized. Time: O(n), Space O(m), m is size of char-set 35ms */
	public int lengthOfLongestSubstring(String s) {
		int lastIndices[] = new int[256];
		for (int i = 0; i < 256; i++) {
			lastIndices[i] = -1;
		}

		int maxLen = 0;
		int curLen = 0;
		int start = 0;
		int bestStart = 0;
		for (int i = 0; i < s.length(); i++) {
			char cur = s.charAt(i);
			if (lastIndices[cur] < start) {
				lastIndices[cur] = i;
				curLen++;
			} else {
				int lastIndex = lastIndices[cur];
				start = lastIndex + 1;
				curLen = i - start + 1;
				lastIndices[cur] = i;
			}

			if (curLen > maxLen) {
				maxLen = curLen;
				bestStart = start;
			}
		}

		return maxLen;
	}

	/** Sliding Window Optimized. Time: O(n), Space O(m), m is size of char-set 35ms*/
	private int lengthOfLongestSubstring4(String s) {
		int n = s.length(), max = 0;
		// save the current index of character
		int[] index = new int[256];
		
		// ababc, i=0, j=1, n=5
		// loop 1: j=0 => 'a' => i=0 => max = 0-0+1=1 => index['a'] = 1
		// loop 2: j=1 => 'b' => i=0 => max = 1-0+1=2 => index['b'] = 2
		// loop 3: j=2 => 'a' => i=1 => max = 2-1+1=2 => index['a'] = 3
		// loop 4: j=3 => 'b' => i=2 => max = 3-2+1=2 => index['b'] = 4
		// loop 5: j=4 => 'c' => i=2 => max = 4-2+1=3 => index['c'] = 5
		// j=4<5, END. return 3;
		// String: a	b	a	b	c
		// loop 1: ij
		// loop 2: i	j
		// loop 3: 		i	j
		// loop 4:			i	j
		// loop 5:			i		j
		for (int i = 0, j = 0; j < n; j++) {
			Character ch = s.charAt(j);
			// check the last char index saved in index[]
			// if no last appearance(new char), i stay, or last char appearance position + 1
			i = Math.max(index[ch], i);
			// current range + initial length(1)
			max = Math.max(max, j - i + 1);
			// for 'aba', make range becomes 2 instead of 3
			// last char appearance position + 1
			index[ch] = j + 1;
		}
		return max;
	}

	/** Sliding Window Time: O(n), Space O(min(m,n)) 42ms*/
	private int lengthOfLongestSubstring3(String s) {
		int n = s.length(), max = 0;
		Map<Character, Integer> map = new HashMap<>(); // current index of character

		// try to extend the range [i, j]
		for (int i = 0, j = 0; j < n; j++) {
			Character ch = s.charAt(j);

			if (map.containsKey(ch))
				i = Math.max(map.get(ch), i);

			max = Math.max(max, j - i + 1);
			map.put(ch, j + 1);
		}
		return max;
	}

	/** Sliding Window Time: O(2n), Space O(min(m,n)) 46ms */
	private int lengthOfLongestSubstring2(String s) {
		Set<Character> set = new HashSet<>();
		int N = s.length();
		int max = 0, i = 0, j = 0;

		// note: no need i < N, bc j always >= i
		while (j < N) {
			// try to extend the range [i,j]
			char ch = s.charAt(j);
			if (!set.contains(ch)) {
				set.add(ch);
				j++;
				max = Math.max(max, j - i);
			} else {
				set.remove(s.charAt(i));
				i++;
			}
		}

		return max;
	}

	/**
	 * First Try Brute Force Time: O(n^3), Space: O(min(n,m)), size of string is n,
	 * size of char-set is m
	 */
	private int lengthOfLongestSubstring1(String s) {
		int N = s.length();
		int ans = 0;

		for (int i = 0; i < N; i++)
			for (int j = i + 1; j <= N; j++)
				if (allUnique(s, i, j))
					// j - i is the start and end for allunique
					// function, which gives max length
					ans = Math.max(ans, j - i);

		return ans;
	}

	private boolean allUnique(String s, int start, int end) {
		Set<Character> set = new HashSet<>();
		// iterate all char between start and end - 1
		// filter repeating chars to check unique
		for (int i = start; i < end; i++) {
			Character ch = s.charAt(i);
			if (set.contains(ch))
				return false;
			set.add(ch);
		}
		return true;
	}

}
