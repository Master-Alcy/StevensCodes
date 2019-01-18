package greedy;

import java.util.Arrays;
import java.util.Comparator;

public class NonOverlappingIntervals {

    private class Interval {
        int start;
        int end;

        Interval() {
            start = 0;
            end = 0;
        }

        Interval(int s, int e) {
            start = s;
            end = e;
        }
    }

    /**
     * Optimal, Greedy, O(nlogn) + O(n) => O(nlogn)
     */
    private int eraseOverlapIntervals2(Interval[] intervals) {
        Arrays.sort(intervals, new Comparator<Interval>() {
            @Override
            public int compare(Interval o1, Interval o2) {
                return o1.start != o2.start ? o1.start - o2.start : o1.end - o2.end;
            }
        });
        int pre = Integer.MIN_VALUE, count = 0;

        for (Interval interval : intervals) {
            if (pre <= interval.start) {
                pre = interval.end;
            } else if (pre >= interval.end) {
                count++;
                pre = interval.end;
            } else {
                count++;
            }
        }
        return count;
    }

    private int eraseOverlapIntervals(Interval[] intervals) {
        if (intervals.length < 2)
            return 0;
        Arrays.sort(intervals,
                (a, b) -> (a.end != b.end) ? a.end - b.end : b.start - a.start
        );
        int end = Integer.MIN_VALUE;
        int count = 0;

        for (Interval interval : intervals) {
            if (interval.start >= end)
                end = interval.end;
            else
                count++;
        }

        return count;
    }
}
