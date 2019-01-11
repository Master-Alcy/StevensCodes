package dual.pointer;

import java.util.HashSet;

@SuppressWarnings("unused")
public class SumOfSquareNumbers {

    public static void main(String[] args) {
        SumOfSquareNumbers ss = new SumOfSquareNumbers();
        int input = 4;
        System.out.println(ss.judgeSquareSum(input));
    }

    /** 13ms 58.8% */
    private boolean judgeSquareSum(int c) {
        int lo = 0, hi = (int)Math.sqrt(c);

        while (lo <= hi) {
            int square = lo * lo + hi * hi;

            if (square < c)
                lo++;
            else if (square > c)
                hi--;
            else if (square == c)
                return true;
        }

        return false;
    }

    /** 132ms 2.8% */
    private boolean judgeSquareSum2(int c) {
        int lo, hi = (int)Math.sqrt(c);
        HashSet<Integer> set = new HashSet<>();

        for (lo = 0; lo <= hi; lo++) {
            int square = lo * lo;
            set.add(square);
            if (set.contains(c - square))
                return true;
        }

        return false;
    }
}
