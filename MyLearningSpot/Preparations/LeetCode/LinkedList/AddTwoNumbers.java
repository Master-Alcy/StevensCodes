package LinkedList;

import java.math.BigInteger;

@SuppressWarnings("unused")
public class AddTwoNumbers {

	public static void main(String[] args) {
		AddTwoNumbers ad = new AddTwoNumbers();

//		ListNode l1 = ad.new ListNode(2);
//		ListNode l11 = ad.new ListNode(4);
//		ListNode l111 = ad.new ListNode(3);
//		ListNode l2 = ad.new ListNode(5);
//		ListNode l22 = ad.new ListNode(6);
//		ListNode l222 = ad.new ListNode(4);

		ListNode l1 = ad.new ListNode(9);
		ListNode l21 = ad.new ListNode(1);
		ListNode l22 = ad.new ListNode(9);
		ListNode l23 = ad.new ListNode(9);
		ListNode l24 = ad.new ListNode(9);
		ListNode l25 = ad.new ListNode(9);
		ListNode l26 = ad.new ListNode(9);
		ListNode l27 = ad.new ListNode(9);
		ListNode l28 = ad.new ListNode(9);
		ListNode l29 = ad.new ListNode(9);
		ListNode l210 = ad.new ListNode(9);

		l21.next = l22;
		l22.next = l23;
		l23.next = l24;
		l24.next = l25;
		l25.next = l26;
		l26.next = l27;
		l27.next = l28;
		l28.next = l29;
		l29.next = l210;

		ListNode res = ad.addTwoNumbers2(l1, l21);

		while (res != null) {
			System.out.println(res.val);
			res = res.next;
		}

		System.out.println("End");
	}

	/** Passed in 74 ms */
	private ListNode addTwoNumbers(ListNode l1, ListNode l2) {
		StringBuilder num1 = new StringBuilder(), num2 = new StringBuilder();
		ListNode current = l1;

		while (current != null) {
			num1.append(current.val);
			current = current.next;
		}

		current = l2;
		while (current != null) {
			num2.append(current.val);
			current = current.next;
		}

		BigInteger result = new BigInteger(num1.reverse().toString()).add(new BigInteger(num2.reverse().toString()));
		String[] resultString = result.toString().split("");
		int tailIndex = resultString.length - 1;

		// root holds first element
		ListNode root = new ListNode(Integer.parseInt(resultString[tailIndex]));
		ListNode temp = null;

		for (int i = tailIndex - 1; i >= 0; i--) {
			if (root.next == null) {
				temp = new ListNode(Integer.parseInt(resultString[i]));
				root.next = temp;
			} else {
				temp.next = new ListNode(Integer.parseInt(resultString[i]));
				temp = temp.next;
			}
		}

		return root;
	}
	
	/** Passed in 39 ms */
	private ListNode addTwoNumbers2(ListNode l1, ListNode l2) {
		int thisRound = 0, stageSum = 0;
		// Use tail to hold root, a better way than mine
		// Base root is useless, but don't need to create root inside of the loop
		ListNode root = new ListNode(0), tail = root;

		while (!(l1 == null && l2 == null && thisRound == 0)) {
			int num1 = (l1 != null) ? l1.val : 0;
			int num2 = (l2 != null) ? l2.val : 0;
			
			// stage sum will never beyond 27 (9 + 9 + 9)
			stageSum = num1 + num2 + thisRound;
			// thisRound must be 0 - 9
			thisRound = stageSum / 10;

			// A bit slower: sum>=10 ? sum-10 : sum
			ListNode newNode = new ListNode(stageSum % 10);
			tail.next = newNode;
			tail = newNode;

			if (l1 != null)
				l1 = l1.next;
			if (l2 != null)
				l2 = l2.next;
		}

		return root.next;
	}

	private class ListNode {
		int val;
		ListNode next;

		ListNode(int x) {
			val = x;
		}
	}

}
