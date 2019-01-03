package chapter1;

public class Union_Find_Weighted {
	private int[] id; // parent link (site indexed)
	private int[] sz; // size of component for roots (site indexed)
	private int count; // number of components

	public Union_Find_Weighted(int N) {
		count = N;
		id = new int[N];
		sz = new int[N];
		for (int i = 0; i < N; i++) {
			id[i] = i;
			sz[i] = 1;
		}
	}

	public int count() {
		return count;
	}

	public boolean connected(int p, int q) {
		return find(p) == find(q);
	}

	private int find(int p) { // Follow links to find a root.
		// int temp = p;	// PathCompressionWeightedQuickUnion
		while (p != id[p])
			p = id[p];
		// id[temp] = p;	// PathCompressionWeightedQuickUnion
		return p;
	}

	public void union(int p, int q) {
		int i = find(p);
		int j = find(q);
		if (i == j)
			return;
		// Make smaller root point to larger one.
		if (sz[i] < sz[j]) {
			id[i] = j;
			// id[i] = id[j];	// PathCompressionWeightedQuickUnion
			sz[j] += sz[i];
		} else {
			id[j] = i;
			// id[j] = id[i];	// PathCompressionWeightedQuickUnion
			sz[i] += sz[j];
		}
		count--;
	}
}
