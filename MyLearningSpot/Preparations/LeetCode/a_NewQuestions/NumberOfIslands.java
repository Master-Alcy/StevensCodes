package a_NewQuestions;

import java.util.ArrayDeque;
import java.util.Deque;

@SuppressWarnings("unused")
public class NumberOfIslands {

	public static void main(String[] args) {
		NumberOfIslands noi = new NumberOfIslands();
		char[][] grid1 = { { '1', '1', '1', '1', '0' }, { '1', '1', '0', '1', '0' }, { '1', '1', '0', '0', '0' },
				{ '0', '0', '0', '0', '0' } };
		char[][] grid2 = { { '1', '1', '0', '0', '0' }, { '1', '1', '0', '0', '0' }, { '0', '0', '1', '0', '0' },
				{ '0', '0', '0', '1', '1' } };
		char[][] grid3 = {};
		char[][] grid4 = { { '1', '1', '1' }, { '0', '1', '0' }, { '1', '1', '1' }, { '0', '0', '0', '1', '1' } };

		System.out.println(noi.numIslands3(grid4));
	}

	/** Third try with BFS */
	private int numIslands3(char[][] grid) {
		int count = 0;
		int row = grid.length;
		if (row == 0 || grid == null)
			return 0;
		int col = grid[0].length;

		for (int i = 0; i < row; i++) {
			for (int j = 0; j < col; j++) {
				BFS(grid, i, j, row, col);
				count++;
			}
		} // End of loop

		return count;
	}

	private void BFS(char[][] grid, int i, int j, int row, int col) {
		grid[i][j] = '0';
		Deque<Integer> queue = new ArrayDeque<>();
		int currentIndex = i * col + j;
		queue.offer(currentIndex);
		while (!queue.isEmpty()) {
			currentIndex = queue.poll();
			i = currentIndex / col; // current row number
			j = currentIndex % col; // current col number
			if (i > 0 && grid[i - 1][j] == '1') { // up
				queue.offer((i - 1) * col + j);
				grid[i - 1][j] = '0';
			}
			if (i < row - 1 && grid[i + 1][j] == '1') { // down
				queue.offer((i + 1) * col + j);
				grid[i + 1][j] = '0';
			}
			if (j > 0 && grid[i][j - 1] == '1') { // left
				queue.offer(i * col + j - 1);
				grid[i][j - 1] = '0';
			}
			if (j < col - 1 && grid[i][j + 1] == '1') { // right
				queue.offer(i * col + j + 1);
				grid[i][j + 1] = '0';
			}
		} // End of while loop
	}

	/** Second try with DFS 61% 5ms */
	private int numIslands2(char[][] grid) {
		int count = 0;
		int row = grid.length;
		if (row == 0 || grid == null)
			return 0;
		int col = grid[0].length; // don't want to call .length twice

		for (int i = 0; i < row; i++) {
			for (int j = 0; j < col; j++) {
				if (grid[i][j] == '1') {
					// This DFS will set all reachable land to water
					DFS(grid, i, j, row, col);
					count++;
				}
			}
		} // End of loop

		return count;
	}

	/**
	 * R for return 1 1 0 | 0 > 1 0 | 0 < 0 > 0 | R 0 R | 0 R 0 | v | ^ v | ^ | 1 1
	 * 0 | 1 1 0 | 0 > 1 0 | 0 < 0 > 0 | R 0 R | | v | v | 0 0 0 | 0 0 0 | 0 0 0 | R
	 * 0 0 | 0 R 0
	 */
	private void DFS(char[][] grid, int i, int j, int row, int col) {
		if (i < 0 || j < 0 || i >= row || j >= col || grid[i][j] != '1')
			return;
		// If this is in boundary and equals to '1'
		grid[i][j] = '0'; // set to '0'
		// Note that
		DFS(grid, i + 1, j, row, col);
		DFS(grid, i - 1, j, row, col);
		DFS(grid, i, j + 1, row, col);
		DFS(grid, i, j - 1, row, col);
	}

	/** first try with UF Note that grid is surrounded by water. 11ms */
	private int numIslands(char[][] grid) {
		int rowMax = grid.length;
		if (grid == null || rowMax == 0)
			return 0;
		int colMax = grid[0].length;
		UnionFind uf = new UnionFind(grid, rowMax, colMax);

		for (int i = 0; i < rowMax; i++) {
			for (int j = 0; j < colMax; j++) {
				if (grid[i][j] == '1') {
					int currentIndex = i * colMax + j;
					// Note if (i + 1 < rowMax) failed, grid won't throw out of boundary
					if (i + 1 < rowMax && grid[i + 1][j] == '1') // down
						uf.union(currentIndex, currentIndex + colMax);
					if (j + 1 < colMax && grid[i][j + 1] == '1') // right
						uf.union(currentIndex, currentIndex + 1);
				} // End of if
			} // End of inner for loop
		} // End of outer for loop

		return uf.count();
	}

	/**
	 * Optimized Weighted quick-union by rank with path compression by halving.
	 * Constructor: O(N), Union: O(near 1), Find O(near 1)
	 */
	public class UnionFind {
		private int[] parent; // parent of node
		private byte[] rank; // rank of subtree rooted at node, never more than 31
		private int count; // number of components

		// Only modified this constructor
		public UnionFind(char[][] grid, int row, int col) {
			int size = row * col;
			count = 0;
			parent = new int[size];
			rank = new byte[size];

			for (int i = 0; i < row; i++) {
				for (int j = 0; j < col; j++) {
					if (grid[i][j] == '1') {
						count++;
					}
					// currentIndex turn Matrix-Index into Array-Index
					int currentIndex = i * col + j;
					parent[currentIndex] = currentIndex;
					rank[currentIndex] = 0;
				}
			}
		}

		public int count() {
			return count;
		}

		public int find(int node) {
			while (node != parent[node]) {
				parent[node] = parent[parent[node]]; // path compression by halving
				node = parent[node];
			}
			return node;
		}

		public void union(int node1, int node2) {
			int root1 = find(node1);
			int root2 = find(node2);
			if (root1 == root2)
				return;
			// make root of smaller rank point to root of larger rank
			if (rank[root1] < rank[root2])
				parent[root1] = root2;
			else if (rank[root1] > rank[root2])
				parent[root2] = root1;
			else {
				// if rank the same, attach to root1 and make root1's rank one level larger
				parent[root2] = root1;
				rank[root1]++;
			}
			count--;
		}
	}// End of Optimized UF
}
