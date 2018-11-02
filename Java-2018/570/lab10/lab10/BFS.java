
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.Queue;

public class BFS {

	public static void main(String[] args) {
		System.out.println("'infile.dat' is assumed to be undirected graph."
				+ "\nFirst line is nodes and edges, then following lines "
				+ "\nare edges from 1st integer to 2nd integer."
				+ "\nNodes are in ascending order,"
				+ "\nand started from zero. Ex: 0, 1, 2, 3, 4.\n");
		int[][] graph = graph();
		System.out.println("Graph is read as shown below: ");
		System.out.println(Arrays.deepToString(graph));
		System.out.println("First column is nodes, second column is bfn."
				+ "\n'bfn' is the order of nodes are being discovered in BFS.\n");		
		bfs(graph, 0);	
	}

	private static void bfs(int[][] graph, int root) {
		Queue<Integer> q = new LinkedList<Integer>();
		int nodes = graph.length;
		int[] visited = new int[nodes];
		visited[root] = 1;
		int bfn = 1;
		q.add(root);
		
		while(!q.isEmpty()){
			int element = q.remove();
			System.out.println(element + " " + (bfn ++));
			for (int i = element; i < nodes; i++){
				if (graph[element][i] == 1 && visited[i] == 0) {
					q.add(i);
					visited[i] = 1;
				}
			}
		}
	}

	private static int[][] graph() {
		try {
			BufferedReader br = new BufferedReader(new FileReader("infile.dat"));
			String str = br.readLine();
			String[] base = str.split("[\\s\\t]+");
			int nodes = Integer.parseInt(base[0]);
			int edges = Integer.parseInt(base[1]);
			int[][] matrix = new int[nodes][nodes];
			int endNode1, endNode2;
			
			for (int i = 0; i < edges; i++) {
				base = br.readLine().split("[\\s\\t]+");
				endNode1 = Integer.parseInt(base[0]);
				endNode2 = Integer.parseInt(base[1]);
				matrix[endNode1][endNode2] = 1;
				matrix[endNode2][endNode1] = 1;
			}
			br.close();
			return matrix;
		} catch (FileNotFoundException e) {
			System.out.println("File not found error.");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("IO error.");
			e.printStackTrace();
		}
		return null;
	}
}