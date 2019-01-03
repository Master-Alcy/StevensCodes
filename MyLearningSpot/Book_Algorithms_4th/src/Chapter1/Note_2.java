package chapter1;

import edu.princeton.cs.algs4.*;

public class Note_2 {

	public static void main(String[] args) {
		Counter heads = new Counter("heads");
		Counter tails = new Counter("tails");
		heads.increment();
		int a = heads.tally() - tails.tally();
		StdOut.println(a);
		StdOut.println(heads);
		// "\\s+" means "one or more tabs, spaces, newlines, or returns
		
	}
	
	public interface Datable {
		int month();
		int day();
		int year();
	}
	
	public class Data implements Datable {

		@Override
		public int month() {
			return 0;
		}

		@Override
		public int day() {
			return 0;
		}

		@Override
		public int year() {
			return 0;
		}
	}
}