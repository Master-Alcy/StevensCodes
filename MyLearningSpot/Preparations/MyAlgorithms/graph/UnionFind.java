package graph;

interface UF {
	/** True if node1 and node2 are in the same component */
	boolean connected(int node1, int node2);
	/** Number of components */
	int count();
	/** Find the component identifier for node (0 to N-1) */
	int find(int node);
	/** Add connection between node1 and node2 */
	void union(int node1, int node2);
}

/**
 * Optimized Weighted quick-union by rank with path compression by halving.
 * Constructor: O(N), Union: O(near 1), Find O(near 1)
 */
public class UnionFind {
	private int[] parent; // parent of node
	private byte[] rank; // rank of subtree rooted at node, never more than 31
	private int count; // number of components

	public UnionFind(int size) {
		this.count = size;
		parent = new int[size];
		rank = new byte[size]; // array size and byte value is two things
		for (int i = 0; i < size; i++) {
			parent[i] = i;
			rank[i] = 0;
		}
	}

	public int count() {
		return count;
	}

	public boolean connected(int node1, int node2) {
		return find(node1) == find(node2);
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



/**
 * 1. Quick-Find Implementation M new edges, N new nodes, them O(NM) for new
 * union. Time: Constructor: O(N), Union: O(N), Find O(1)
 */
class UnionFind1 implements UF {
	/** count number of components */
	private int count;
	/** access to component id (In node index) */
	private int[] id;

	/** UnionFind Initialize N nodes with integer names (0 to N-1) */
	public UnionFind1(int size) {
		this.count = size;
		id = new int[size];
		for (int i = 0; i < size; i++)
			id[i] = i;
	}

	@Override
	public boolean connected(int node1, int node2) {
		return find(node1) == find(node2);
	}

	@Override
	public int count() {
		return count;
	}

	@Override
	// Quick-Find is to make the find as fast as possible
	public int find(int node) {
		return id[node];
	}

	@Override
	public void union(int node1, int node2) {
		// get the ID of two nodes
		int node1Id = find(node1);
		int node2Id = find(node2);
		// if same id, return
		if (node1Id == node2Id)
			return;
		// iterate through all nodes once, change all old node1's id to node2's id
		for (int i = 0, N = id.length; i < N; i++)
			if (id[i] == node1Id)
				id[i] = node2Id;
		count--;
	}

}

/**
 * 2. Quick-Union Implementation. Idea is to use parent-link to organize the
 * nodes. id[p] is the parent index of node p, if p is root, then id[p] is p.
 * Thus, for find, a node can always find its root node (id[root] == root), then
 * use index of root for index of component. For a new pair, first find both
 * root id, then do the similar things. However, this find of data structure
 * might have bad situations like BST becomes a linked list. Time: Constructor:
 * O(N), Union: O(Tree Height), Find O(Tree Height)
 */
class UnionFind2 implements UF {
	private int count;
	private int[] id;

	@Override
	public boolean connected(int node1, int node2) {
		return find(node1) == find(node2);
	}

	@Override
	public int count() {
		return count;
	}

	@Override
	public int find(int node) {
		// Find node's root with (id[root] == root)
		while (node != id[node])
			node = id[node];
		return node;
	}

	@Override
	public void union(int node1, int node2) {
		int node1Root = find(node1);
		int node2Root = find(node2);
		if (node1Root == node2Root)
			return;
		// Turn a tree's root to another tree's child
		id[node1Root] = node2Root;
		count--;
	}

}

/**
 * 3. Weighted Quick-Union Always attach smaller tree to larger tree => tree
 * height much smaller Time: Constructor: O(N), Union: O(log N), Find O(log N)
 * 4. Compressed Path to make the height => make tree height to one Time:
 * Constructor: O(N), Union: O(near 1), Find O(near 1) Note that UF cannot get
 * path, for that need DFS and BFS
 */
class UnionFind4 implements UF {
	private int count;
	private int[] id;
	private int[] sz;

	public UnionFind4(int size) {
		this.count = size;
		for (int i = 0; i < size; i++) {
			id[i] = i;
			sz[i] = 1;
		}
	}

	@Override
	public boolean connected(int node1, int node2) {
		return find(node1) == find(node2);
	}

	@Override
	public int count() {
		return count;
	}

	@Override
	public int find(int node) {
		// Find node's root with (id[root] == root)
		// For each node, make its parent's parent's ID become its ID
		while (node != id[node]) {
			id[node] = id[id[node]];
			node = id[node];
		}
		return node;
	}

	@Override
	public void union(int node1, int node2) {
		int node1Root = find(node1);
		int node2Root = find(node2);

		if (node1Root == node2Root)
			return;
		// Turn a tree's root to another tree's child
		// update size to make sure weighted
		if (sz[node1Root] < sz[node2Root]) {
			id[node1Root] = node2Root;
			sz[node2Root] += sz[node1Root];
		} else {
			id[node2Root] = node1Root;
			sz[node1Root] += sz[node2Root];
		}
		count--;
	}

}
