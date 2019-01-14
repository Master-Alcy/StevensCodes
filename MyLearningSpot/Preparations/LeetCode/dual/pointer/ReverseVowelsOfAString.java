package dual.pointer;

import java.util.HashSet;

@SuppressWarnings("unused")
public class ReverseVowelsOfAString {

    public static void main(String[] args) {
        ReverseVowelsOfAString rv = new ReverseVowelsOfAString();
        String test = "A man, a plan, a canal: Panama";
        System.out.println(rv.reverseVowels2(test));
    }

    /**
     * second try: 5ms, 88.07% Optimal enough
     */
    private String reverseVowels2(String s) {
        int i = 0, j = s.length() - 1;
        if (j <= 0)
            return s;
        char[] cArr = s.toCharArray();

        while (i < j) {
            char lo = cArr[i];
            char hi = cArr[j];
            while (i < j && !isVowel(lo))
                lo = cArr[++i];
            while (i < j && !isVowel(hi))
                hi = cArr[--j];
            // Worst case is i == j here, which is fine
            // Adding additional check not worth it.
            swap(cArr, i++, j--);
        }
        return new String(cArr);
    }

    private boolean isVowel(char ch) {
        char c = Character.toLowerCase(ch);
        return c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u';
    }

    private void swap(char[] arr, int i, int j) {
        char temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }

    /**
     * first try: 844ms 4.56% slow
     */
    private String reverseVowels(String s) {
        int i = 0, j = s.length() - 1;
        if (j <= 0)
            return s;
        String result = s;
        char lo = s.charAt(i);
        char hi = s.charAt(j);
        char[] vowels = {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'};
        HashSet<Character> set = new HashSet<>();
        for (int k = 0; k < 10; k++)
            set.add(vowels[k]);

        while (i < j) {
            if (set.contains(lo) && set.contains((hi))) {
                result = swap(result, i, j, lo, hi);
                lo = s.charAt(++i);
                hi = s.charAt(--j);
            } else if (!set.contains(lo))
                lo = s.charAt(++i);
            else if (!set.contains(hi))
                hi = s.charAt(--j);
        }
        return result;
    }

    private String swap(String s, int i, int j, char lo, char hi) {
        char[] temp = s.toCharArray();
        temp[i] = hi;
        temp[j] = lo;
        return new String(temp);
    }

}
