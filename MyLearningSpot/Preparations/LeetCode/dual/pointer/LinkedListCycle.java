package dual.pointer;

import java.util.HashSet;
import java.util.Set;
// alt + enter // intention action
// ctrl + space // templates

public class LinkedListCycle {

    public static void main(String[] args) {
        LinkedListCycle llc = new LinkedListCycle();
        ListNode node1 = llc.new ListNode(3);
        ListNode node2 = llc.new ListNode(2);
        ListNode node3 = llc.new ListNode(0);
        ListNode node4 = llc.new ListNode(-4);
        node1.next = node2;
        node2.next = node3;
        node3.next = node4;
        node4.next = node2;

        boolean res = llc.hasCycle2(node1);
        System.out.println(res);
    }

    private class ListNode {
        int val;
        ListNode next;

        ListNode(int x) {
            val = x;
            next = null;
        }
    }

    /**
     * 9ms 16.69% Creating a set is slow
     */
    private boolean hasCycle2(ListNode head) {
        Set<ListNode> set = new HashSet<>();
        while (head != null) {
            if (set.contains(head))
                return true;
            else
                set.add(head);
            head = head.next;
        }
        return false;
    }

    /**
     * 1ms 94.85% Optimal
     */
    private boolean hasCycle(ListNode head) {
        if (head == null || head.next == null)
            return false;
        ListNode nodeSlow = head;
        ListNode nodeFast = head.next;
        while (nodeSlow != nodeFast) {
            // nodeFast is faster, thus no need to check nodeslow
            if (nodeFast == null || nodeFast.next == null)
                return false;
            nodeSlow = nodeSlow.next;
            nodeFast = nodeFast.next.next;
        }
        return true;
    }
}
