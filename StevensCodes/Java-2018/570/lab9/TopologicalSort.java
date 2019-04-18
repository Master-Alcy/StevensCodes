
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class TopologicalSort {

	public static void main(String[] args) {
		System.out.println("'infile.dat' is assumed to be DAG."
				+ "\nFirst line is nodes and edges, then following lines "
				+ "\nare directed line from 1st integer to 2nd integer."
				+ "\nNodes are in ascending order,"
				+ "\nand started from zero. Ex: 0, 1, 2, 3, 4.\n");
		List<ArrayList<Integer>> graph1 = graph();
		System.out.println("Graph1 is read as shown below: ");
		System.out.println(graph1.toString());
		List<ArrayList<Integer>> graph2 = graph();
		System.out.println("Graph2 is read as shown below: ");
		System.out.println(graph2.toString());
		System.out.println();
		TopologivalSort1(graph1);
		TopologivalSort2(graph2);
	}

	private static void TopologivalSort1(List<ArrayList<Integer>> graph) {
		int x = 0;
		int[] nonZero = new int [graph.size()];
		int[] sorted = new int[graph.size()];
		
		while (true){
			//System.out.println(graph);
			//System.out.println(Arrays.toString(nonZero));
			//count in-degree
			for (int i = 0; i < graph.size(); i++){
				for (int j = 0; j < graph.get(i).size(); j++){
					//means this node has been deleted
					if (graph.get(i).get(0) == -1){
						continue;		
					}
					nonZero[graph.get(i).get(j)] += 1;
				}
			}
			//System.out.println(graph);
			//System.out.println("Counted :" + Arrays.toString(nonZero));
			//check zero in-degree nodes
			int acyclic = 0;
			int skip = 0;
			for (int i = 0; i < nonZero.length; i++){
				if (nonZero[i] == 0){
					x ++;
					sorted[i] = x;
					for (int j = 0; j < graph.get(i).size(); j++){
						graph.get(i).set(j, -1);	//means this node is deleted
					}
					nonZero[i] = -1;		//means deleted
				} else if (nonZero[i] == -1) {
					skip ++;
					continue;				//skipped
				} else {
					nonZero[i] = 0;			//re-initiate
					acyclic++;
				}
			}
			int finish = 0;
			for (int i = 0; i < nonZero.length; i ++){
				if (nonZero[i] == -1){
					finish ++;
				}
			}
			if (finish == nonZero.length){
				break;
			}
			if (acyclic == nonZero.length - skip){
				System.out.println("Graph is not acyclic");
				return;
			}
			//System.out.println(graph);
			//System.out.println(Arrays.toString(nonZero));
			//System.out.println("Sorted: " + Arrays.toString(sorted));
			//System.out.println("Loop once.");
		}
		System.out.println("Topological Sort One :");
		System.out.println("Finished: " + Arrays.toString(sorted));
	}
	
	private static void TopologivalSort2(List<ArrayList<Integer>> graph) {
		int x = 0;
		int[] nonZero = new int [graph.size()];
		int[] sorted = new int[graph.size()];
		
		while (true){
			//System.out.println(graph);
			//System.out.println(Arrays.toString(nonZero));
			//count in-degree
			for (int i = 0; i < graph.size(); i++){
				for (int j = 0; j < graph.get(i).size(); j++){
					//means this node has been deleted
					if (graph.get(i).get(0) == -1){
						continue;		
					}
					nonZero[graph.get(i).get(j)] += 1;
				}
			}
			//System.out.println(graph);
			//System.out.println("Counted :" + Arrays.toString(nonZero));
			//check zero in-degree nodes
			int acyclic = 0;
			int skip = 0;
			for (int i = nonZero.length - 1; i >= 0; i--){
				if (nonZero[i] == 0){
					x ++;
					sorted[i] = x;
					for (int j = 0; j < graph.get(i).size(); j++){
						graph.get(i).set(j, -1);	//means this node is deleted
					}
					nonZero[i] = -1;		//means deleted
				} else if (nonZero[i] == -1) {
					skip ++;
					continue;				//skipped
				} else {
					nonZero[i] = 0;			//re-initiate
					acyclic++;
				}
			}
			int finish = 0;
			for (int i = 0; i < nonZero.length; i ++){
				if (nonZero[i] == -1){
					finish ++;
				}
			}
			if (finish == nonZero.length){
				break;
			}
			if (acyclic == nonZero.length - skip){
				System.out.println("Graph is not acyclic");
				return;
			}
			//System.out.println(graph);
			//System.out.println(Arrays.toString(nonZero));
			//System.out.println("Sorted: " + Arrays.toString(sorted));
			//System.out.println("Loop once.");
		}
		System.out.println("Topological Sort Two :");
		System.out.println("Finished: " + Arrays.toString(sorted));
	}

	private static List<ArrayList<Integer>> graph() {
		List<ArrayList<Integer>> list2d = new ArrayList<ArrayList<Integer>>();	
		try {
			BufferedReader br = new BufferedReader(new FileReader("infile.dat"));
			String str = br.readLine();
			String[] base = str.split("[\\s\\t]+");
			int nodes = Integer.parseInt(base[0]);
			int edges = Integer.parseInt(base[1]);
			
			for (int i = 0; i < nodes; i++) {
				list2d.add(new ArrayList<Integer>());
			}
			
			int endNode1, endNode2;
			
			for (int i = 0; i < edges; i++) {
				base = br.readLine().split("[\\s\\t]+");
				endNode1 = Integer.parseInt(base[0]);
				endNode2 = Integer.parseInt(base[1]);
				list2d.get(endNode1).add(endNode2);
			}
			br.close();
		} catch (FileNotFoundException e) {
			System.out.println("File not found error.");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("IO error.");
			e.printStackTrace();
		}
		return list2d;
	}
}