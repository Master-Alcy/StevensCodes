import java.util.Scanner;

public class LinkListCQ {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String input = "";
		LinkListCQ q = new LinkListCQ(12);

		while (true) {
			System.out.println(q);
			System.out.println("Enter string to enqueue, 'quit' to dequeue all data and exit.");
			input = sc.next();
			if (input.equals("quit")){
				if (maxReached){
					for (int i = 0; i < q.size; i++){
						System.out.println(q.dequeue());
					}
				}else{
					int temp = count;
					for (int i = 0; i < temp; i++){
						System.out.println(q.dequeue());
					}
				}
				break;
			}
			q.enqueue(input);
		}
		System.out.println("CQ stops.");
		sc.close();
	}

	class Node {
		String data;
		Node next;
		
		Node(String in) {
			this.data = in;
		}
	}

	private Node start;
	private Node end;
	private int size;
	static int count;
	static boolean maxReached;

	LinkListCQ(int in) {
		start = null;
		end = null;
		size = in;
		count = 0;
		maxReached = false;
	}

	public void enqueue(String str) {
		Node node = new Node(str);

		if (count == 0) {
			start = end = node;
		} else if(count == size){
			maxReached = true;
			start = start.next;
			count--;
			enqueue(str);
			return;
		}else{
			end.next = node;
			end = node;
		}
		count = (count + 1) % (size + 1);
	}

	public String dequeue() {
		if (count == 0) {
			System.out.println("Queue is empty.");
		}
		String result = start.data;
		start = start.next;
		count--;
		return result;
	}

	public String toString() {
		String result = "";
		Node temp = start;
		if (temp == null) {
			return "Queue is empty.";
		} else {
			while (temp != null) {
				result += temp.data + " ";
				temp = temp.next;
			}
		}
		return result;
	}
}