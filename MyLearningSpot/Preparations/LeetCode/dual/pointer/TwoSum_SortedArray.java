package dual.pointer;

import java.util.Arrays;

public class TwoSum_SortedArray {

    public static void main(String[] args) {
        TwoSum_SortedArray ts = new TwoSum_SortedArray();
        int[] arr = {2, 7, 11, 15};
        int[] res = ts.twoSum(arr, 9);
        System.out.println(Arrays.toString(res));
    }

    private int[] twoSum(int[] numbers, int target) {
        int i = 0, j = numbers.length - 1;

        while (i < j) {
            int sum = numbers[i] + numbers[j];

            if (sum > target)
                j--;
            else if (sum < target)
                i++;
            else
                return new int[]{i + 1, j + 1};
        }
        return null;
    }

}
