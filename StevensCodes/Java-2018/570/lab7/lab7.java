import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.InputMismatchException;
import java.util.Scanner;

public class lab7 {

	public static void main(String[] args) {
		String text = "";
		String str;
		
		try {
			BufferedReader br = new BufferedReader(new FileReader("infile.dat"));
			while (true) {
				if ((str = br.readLine()) == null) {
					break;
				}
				text += str;
			}
			br.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		text = text.replaceAll("[\\t\\n\\s]+", "");
		String[] keys = text.split(",");
		functions t = new functions();
		Scanner sc = new Scanner(System.in);

		for (int i = 0; i < keys.length; i++) {
			t.add(Integer.parseInt(keys[i]));
		}
		
		System.out.println("Reading and inserting completed.");
		System.out.println("Sorted Set A Contains: ");
		t.print(functions.root);
		System.out.println("\nTest 'add(1)': ");
		t.add(1);
		t.print(functions.root);
		System.out.println("\nTest 'remove(1)': ");
		t.remove(1);
		t.print(functions.root);
		System.out.println("\nTest 'isEmpty()': ");
		System.out.println(t.isEmpty());
		System.out.println("\nUser input to test contain: ");
		
		try {
			Boolean cont = t.contains(sc.nextInt());
			if (cont == true) {
				System.out.println("Yes");
			} else {
				System.out.println("No");
			}
		} catch (InputMismatchException e) {
			e.printStackTrace();
		}
		sc.close();
	}
}

class functions implements SortedSet {
	public static Node root;

	public functions() {
		functions.root = null;
	}

	public boolean isEmpty() {
		if (root == null) {
			return true;
		}
		return false;
	}
	
	public void add(int key){
		root = insert(key, root);
	}

	public Node insert(int key, Node current) {
		if (current == null) {
			current = new Node(key);
			return current;
		}

		if (key < current.key) {
			current.left = insert(key, current.left);
		} else if (key > current.key) {
			current.right = insert(key, current.right);
		}
		return current;
	}
		
	public void remove(int key){
		root = delete(key, root);
	}

	public Node delete(int key, Node current){
		
		if (current == null){
			return current;
		}else if (key < current.key){
			current.left = delete(key, current.left);
		}else if (key > current.key){
			current.right = delete(key, current.right);
		}else{
			//0 or 1
			if (current.left == null){
				return current.right;
			}else if (root.right == null){
				return current.left;
			}
			//2
			Node temp = current;
			while(current.left != null){
				temp = current.left;
				current = current.left;
			}
			current = temp;
			current.right = delete(current.key, current.right);
		}	
		return current;
	}
	
	public boolean contains(int key) {
		Node current = root;

		while (!isEmpty()) {
			if (current == null) {
				break;
			}
			if (current.key == key) {
				return true;
			} else if (current.key > key) {
				current = current.left;
			} else {
				current = current.right;
			}
		}
		return false;
	}

	public void print(Node root) {
		if (root != null) {
			print(root.left);
			System.out.print(root.key + " ");
			print(root.right);
		}
	}
}

interface SortedSet {
	public boolean isEmpty();

	public void add(int key);

	public void remove(int key);

	public boolean contains(int key);

	public void print(Node root);
}

class Node {
	int key;
	Node left, right;

	public Node(int key) {
		this.key = key;
		left = right = null;
	}
}