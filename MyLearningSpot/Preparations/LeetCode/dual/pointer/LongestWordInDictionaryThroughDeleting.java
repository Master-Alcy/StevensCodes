package dual.pointer;

import java.util.ArrayList;
import java.util.List;

public class LongestWordInDictionaryThroughDeleting {

    public static void main(String[] args) {
        LongestWordInDictionaryThroughDeleting lwdd = new LongestWordInDictionaryThroughDeleting();
        String test = "abpcplea";
        List<String> li = new ArrayList<>();
        li.add("ale");
        li.add("apple");
        li.add("monkey");
        li.add("plea");
        String res = lwdd.findLongestWord(test, li);
        System.out.println(res);
    }

    /**
     * Optimal 26ms 86.75%, Time O(n*x)
     * where n = number of strings in list d, x = avg(strings' length).
     * Space O(x)
     */
    private String findLongestWord(String s, List<String> d) {
        String longestWord = "";

        for (String subStr : d) {
            int l1 = longestWord.length();
            int l2 = subStr.length();
            // if saved word is longer or lexicographically less then skip this subString
            // a value less than 0 if this string is lexicographically less than the string argument
            if (l1 > l2 || (l1 == l2 && longestWord.compareTo(subStr) < 0))
                continue;
            if (isValid(s, subStr))
                longestWord = subStr;
        }
        return longestWord;
    }

    private boolean isValid(String s, String subStr) {
        int i = 0, j = 0, N = s.length(), M = subStr.length();
        // scan through string and substring, find number of same chars
        while (i < N && j < M) {
            if (s.charAt(i) == subStr.charAt(j))
                j++;
            i++;
        }
        // if j != M, then substring not in this string
        return j == M;
    }
}
