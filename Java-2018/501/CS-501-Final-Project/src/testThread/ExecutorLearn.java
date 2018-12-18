package testThread;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class ExecutorLearn {

	public static void main(String[] args) {
		ExecutorLearn ex = new ExecutorLearn();
		//ExecutorService executor = Executors.newFixedThreadPool(3);
		//ExecutorService executor = Executors.newFixedThreadPool(1);
		ExecutorService executor = Executors.newCachedThreadPool();
		
		executor.execute(ex.new PrintChar('a', 100));
		executor.execute(ex.new PrintChar('b', 100));
		executor.execute(ex.new PrintNum(100));

		executor.shutdown();
		
		while (!executor.isTerminated()) {
		}	// make sure all finished
		
		System.out.println("\nEnd");
	}
	
	@SuppressWarnings("unused")
	private synchronized void deposite (double amount) {
		// should be in a class have a data field
		synchronized (this) {
			// Same as use this keyword at declare
		}
		// Or using lock
		Lock lock = new ReentrantLock();
		lock.lock();
		// do something
		// use finally
		lock.unlock();
		// lock gives more flexibility
	}

	private class PrintChar implements Runnable {
		private char charToPrint; // The character to print
		private int times; // The number of times to repeat

		/** Construct a task with a specified character and number of times to print the character */
		public PrintChar(char c, int t) {
			charToPrint = c;
			times = t;
		}

		@Override /** Override the run() method to tell the system what task to perform */
		public void run() {
			for (int i = 0; i < times; i++) {
				System.out.print(charToPrint);
			}
		}
	}

// The task class for printing numbers from 1 to n for a given n
	private class PrintNum implements Runnable {
		private int lastNum;

		/** Construct a task for printing 1, 2, ..., n */
		public PrintNum(int n) {
			lastNum = n;
		}

		@Override /** Tell the thread how to run */
		public void run() {
			for (int i = 1; i <= lastNum; i++) {
				System.out.print(i);
			}
		}
	}

}
