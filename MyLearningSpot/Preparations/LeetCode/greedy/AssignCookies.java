package greedy;

import java.util.Arrays;

public class AssignCookies {

    public static void main(String[] args) {
        AssignCookies ac = new AssignCookies();

    }

    /**
     * 17 ms, Greedy. O(2nlogn) + O(n) = O(nlogn)
     */
    private int findContentChildren(int[] children, int[] snacks) {
        Arrays.sort(children);
        Arrays.sort(snacks);
        int kid = 0, cookie = 0;

        while (kid < children.length && cookie < snacks.length) {
            if (children[kid] <= snacks[cookie])
                kid++;
            cookie++;
        }
        return kid;
    }
}
