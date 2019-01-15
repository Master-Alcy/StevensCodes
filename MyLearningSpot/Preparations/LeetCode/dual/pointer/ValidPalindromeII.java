package dual.pointer;

@SuppressWarnings("unused")
public class ValidPalindromeII {

    public static void main(String[] args) {
        ValidPalindromeII vp = new ValidPalindromeII();
        String test = "aabbbbcccaa";
        System.out.println(vp.validPalindrome2(test));
    }

    /**
     * second try 35ms 64% Optimal
     */
    private boolean validPalindrome2(String s) {
        int i = -1, j = s.length();
        // For each mismatch, ignore head and tail to see if inner string is palindrome
        while (++i <= --j) // Note ++i and i++ is the same here
            if (s.charAt(i) != s.charAt(j))
                return isPalindrome2(s, i, j - 1) || isPalindrome2(s, i + 1, j);
        return true;
    }

    private boolean isPalindrome2(String str, int i, int j) {
        while (i < j)
            if (str.charAt(i++) != str.charAt(j--))
                return false;
        return true;
    }

    /**
     * first try too slow O(n^2)
     */
    private boolean validPalindrome(String s) {
        int i = 0, j = s.length() - 1;
        if (j <= 0)
            return true;
        StringBuilder sb = new StringBuilder(s);

        if (isPalindrome(sb, i, j))
            return true;
        for (int k = 0, N = s.length(); k < N; k++) {
            char temp = sb.charAt(k);
            sb.deleteCharAt(k);
            if (isPalindrome(sb, i, j - 1))
                return true;
            sb.insert(k, temp);
        }
        return false;
    }

    private boolean isPalindrome(StringBuilder sb, int i, int j) {
        while (i <= j) {
            if (sb.charAt(i) != sb.charAt(j))
                return false;
            i++;
            j--;
        }
        return true;
    }
}
