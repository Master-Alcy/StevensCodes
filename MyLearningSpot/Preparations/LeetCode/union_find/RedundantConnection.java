package union_find;

import java.util.Arrays;

public class RedundantConnection {

	public static void main(String[] args) {
		RedundantConnection r = new RedundantConnection();
		int[][] test = { { 1, 2 }, { 2, 3 }, { 3, 4 }, { 1, 4 }, { 1, 5 } };
		int[] result = r.findRedundantConnection(test);
		System.out.println(Arrays.toString(result));
	}

	/** Union Find */
	public int[] findRedundantConnection(int[][] edges) {
		UnionFind uf = new UnionFind(edges.length);

		for (int[] edge : edges) {
			// make u,v 0-N is much easier than make method 1-N
			int u = edge[0] - 1;
			int v = edge[1] - 1;
			if (uf.connected(u, v)) {
				// if they connected with each other, then redundant
				return edge;
			} else {
				// no connection then union them into one
				uf.union(u, v);
			}
		}
		return null;
	}

	/**
	 * Weighted quick-union by rank with path compression by halving Constructor:
	 * O(N), Union: O(near 1), Find O(near 1) Same Algorithm from Book Algorithms
	 * 4th What this does is creating a tree with minimum height
	 */
	private class UnionFind {
		// un-necessary lines slash out but remain there for other questions
		// private int count; // number of components
		private int[] parent; // node's parent
		private byte[] rank; // rank of node, it should never go above 31

		private UnionFind(int n) {
			// this.count = n;
			parent = new int[n];
			rank = new byte[n];
			for (int i = 0; i < n; i++) {
				parent[i] = i;
				// Initially all rank 1
				rank[i] = 1;
			}
		}

		// public int count() {
		// return count;
		// }

		public boolean connected(int node1, int node2) {
			return find(node1) == find(node2);
		}

		private int find(int node) {
			// Root is node == parent[node]
			// In other words, root points to itself
			// Here we find root ID
			while (node != parent[node]) {
				// Path compression
				parent[node] = parent[parent[node]];
				// find next node
				node = parent[node];
			}
			return node;
		}

		private void union(int x, int y) {
			int root1 = find(x);
			int root2 = find(y);
			// if (root1 == root2)
			// return;

			if (rank[root1] < rank[root2])
				parent[root1] = root2;
			else if (rank[root1] > rank[root2])
				parent[root2] = root1;
			else {
				// same rank then make root1 one rank higher
				parent[root2] = root1;
				rank[root1]++;
			}
			// count--;
		}
	}
}
