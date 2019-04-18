package test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

public class MinorTest {

	public static void main(String[] args) {
		ArrayList<String[]> list = new ArrayList<>();
		String[] s1 = {"a", "b"};
		String[] s2 = {"a", "b", "c"};
		String[] s3 = {"a", "b", "1", "2"};
		
		list.add(s1);
		list.add(s2);
		list.add(s3);
		
		System.out.println(Arrays.toString( list.get(0)));
		System.out.println(Arrays.toString( list.get(1)));
		System.out.println(Arrays.toString( list.get(2)));
		System.out.println(Arrays.toString( list.remove(0)));
		
		@SuppressWarnings("deprecation")
		Date d = new Date(2018, 9, 19);
		System.out.println(d.toString());
	}

}
