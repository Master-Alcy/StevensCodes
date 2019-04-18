package A6;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

public class TestArrayList {

	public static void main(String[] args) {
		ArrayList<String> cities = new ArrayList<String>();
		cities.add("D");
		cities.add("C");
		cities.add("A");
		cities.add("A");
		cities.add("B");
		@SuppressWarnings("unused")
		ArrayList<java.util.Date> dates = new ArrayList<> (); //Since JDK 7
		System.out.println(cities);
		Collections.sort(cities);
		System.out.println(cities);
		
		String[] array1 = {"red", "green", "blue"};
		ArrayList<String> list1 = new ArrayList<>(Arrays.asList(array1));
		
		String[] array2 = new String[list1.size()];
		list1.toArray(array2);
		System.out.println(Arrays.toString(array2));
		
		Integer[] array3 = {3, 5, 95, 4, 15, 34, 3, 6, 5};
		ArrayList<Integer> list2 = new ArrayList<>(Arrays.asList(array3));
		System.out.println(Collections.max(list2));
		System.out.println(Collections.min(list2));
		
		Integer[] array4 = {3, 5, 95, 4, 15, 34, 3, 6, 5};
		ArrayList<Integer> list3 = new ArrayList<>(Arrays.asList(array4));
		java.util.Collections.shuffle(list3);
		System.out.println(list3);
		
		MyStack ms = new MyStack();
		ms.push(1);
		ms.push(2);
		ms.push(3);
		System.out.println(ms);
	}
}

class MyStack {
	private ArrayList<Object> list = new ArrayList<Object>();
	//Constructor is super()
	
	public boolean isEmpty(){
		return list.isEmpty();
	}
	
	public int getSize() {
		return list.size();
	}
	
	public Object peek() {
		return list.get(getSize() - 1);
	}
	
	public Object pop() {
		Object o = list.get(getSize() - 1);
		list.remove(getSize() - 1);
		return o;
	}
	
	public void push (Object o) {
		list.add(o);
	}
	
	@Override
	public String toString() {
		return "stack: " + list.toString();
	}
}