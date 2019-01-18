package dutchflag;

import java.util.Arrays;

public class SortColors {

    public static void main(String[] args) {
        SortColors sc = new SortColors();
        int[] test1 = {2, 0, 2, 1, 1, 0};
        sc.sortColors2(test1);
        System.out.println(Arrays.toString(test1));
    }

    /**
     * Time: O(n), two-pointer like, 3-way quick sort idea
     * 0 ms, 100%
     */
    private void sortColors1(int[] nums) {
        int zero = 0, one = 0, two = nums.length - 1;
        while (one <= two) {
            if (nums[one] == 0) {
                swap(nums, zero, one);
                zero++;
                one++;
            } else if (nums[one] == 2) {
                swap(nums, two, one);
                two--; // recheck the new number
            } else {
                one++;
            }
        }
    }

    private void sortColors2(int[] nums) {
        int zero = 0, one = 0, two = nums.length - 1;
        while (one <= two) {
            if (nums[one] == 0)
                swap(nums, zero++, one++);
            else if (nums[one] == 2)
                swap(nums, two--, one); // recheck the new number
            else
                one++;
        }
    }

    private void sortColors3(int[] nums) {
        int zero = 0, one = 0, two = nums.length - 1;
        while (one <= two)
            switch (nums[one]) {
                case 0:
                    swap(nums, zero++, one++);
                    break;
                case 1:
                    one++;
                    break;
                case 2:
                    swap(nums, two--, one);
                    break;
            }
    }

    private void swap(int[] nums, int i, int j) {
        if (i == j)
            return;
        int temp = nums[i];
        nums[i] = nums[j];
        nums[j] = temp;
    }
}
