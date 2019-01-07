package dfs_bfs;

import java.util.ArrayDeque;
import java.util.Deque;

@SuppressWarnings("unused")
public class MaximumDepthOfBinaryTree {

	public static void main(String[] args) {
		MaximumDepthOfBinaryTree dfs = new MaximumDepthOfBinaryTree();
		Node root = dfs.new Node(0);
		root.left = dfs.new Node(1);
		root.left.right = dfs.new Node(2);
		int depth = dfs.maxDepth3(root);
		System.out.println(depth);
	}

	private class Node {
		int val;
		Node left;
		Node right;

		Node(int x) {
			this.val = x;
		}
	}

	/**
	 * DPS, copied from solution. Recursion Time C: O(n) Space C: O(log(n)), worst case
	 * O(n). Not well supported by Java. Seems Optimal in this case
	 */
	private int maxDepthX(Node root) {
		if (root == null)
			return 0;
		int left_height = maxDepthX(root.left);
		int right_height = maxDepthX(root.right);
		// return Math.max(left_height, right_height) + 1;
		if (left_height > right_height)
			return left_height + 1;
		else
			return right_height + 1;
	}

	/**
	 * This is a BFS(level-order), probably Optimal but for LeetCode this is slower
	 * than recursion
	 */
	private int maxDepth2(Node root) {
		if (root == null)
			return 0;

		/**
		 * According to JavaDoc, ArrayDeque is likely to be faster than Stack when used
		 * as a stack, and faster than LinkedList when used as a queue
		 */
		Deque<Node> queue = new ArrayDeque<>();
		queue.offer(root);
		int depth = 0;

		while (!queue.isEmpty()) {
			int size = queue.size();
			depth++;
			for (int i = 0; i < size; i++) {
				Node aNode = queue.poll();

				if (aNode.left != null)
					queue.offer(aNode.left);
				if (aNode.right != null)
					queue.offer(aNode.right);
			} // End of for loop
		} // End of while loop

		return depth;
	}

	/**
	 * This is a DFS
	 */
	private int maxDepth3(Node root) {
		if (root == null)
			return 0;

		Deque<Node> queue = new ArrayDeque<>();
		queue.offer(root);
		root.val = 1;
		int depth = 0;

		while (!queue.isEmpty()) {
			Node aNode = queue.poll();
			int nodeHeight = aNode.val;
			depth = Math.max(nodeHeight, depth);

			if (aNode.left != null) {
				queue.offer(aNode.left);
				aNode.left.val = nodeHeight + 1;
			}
			if (aNode.right != null) {
				queue.offer(aNode.right);
				aNode.right.val = nodeHeight + 1;
			}
		} // End of while loop

		return depth;
	}

}
