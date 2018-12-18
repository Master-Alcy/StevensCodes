package test;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Semaphore;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class ThreadCooperationLearning {
	
	/*  Set hashSet = Collections.synchronizedSet(new HashSet());
		synchronized (hashSet) { // Must synchronize it
			Iterator iterator = hashSet.iterator();
			while (iterator.hasNext()) {
				System.out.println(iterator.next());
			}
		}  */
	
	// Use buffer.put(some int) and buffer.take(). synchronization already implemented
	@SuppressWarnings("unused")
	private static ArrayBlockingQueue<Integer> buffer = new ArrayBlockingQueue<>(2);
	// Semaphore is used to restrict the number of threads that access a shared resource
	@SuppressWarnings("unused")
	private static Semaphore semaphore = new Semaphore(1);
	
	// Avoid deadlock by resource ordering like Thread1(obj1,obj2) Thread2(obj2,obj1)
	
	private static Account account = new Account();
	
	public static void main(String[] args) {
		ExecutorService executor = Executors.newFixedThreadPool(2);
		executor.execute(new DepositTask());
		executor.execute(new WithdrawTask());
		executor.shutdown();
		System.out.println("Thread 1\t\tThread 2\t\tBalance");
	}

	private static class DepositTask implements Runnable {
		@Override // Keep adding an amount to the account
		public void run() {
			try { // Purposely delay it to let the withdraw method proceed
				while (true) {
					account.deposit((int) (Math.random() * 10) + 1);
					Thread.sleep(1000);
				}
			} catch (InterruptedException ex) {
				ex.printStackTrace();
			}
		}
	}

	private static class WithdrawTask implements Runnable {
		@Override // Keep subtracting an amount from the account
		public void run() {
			while (true) {
				account.withdraw((int) (Math.random() * 10) + 1);
			}
		}
	}

	private static class Account {
		// Create a new lock
		private static Lock lock = new ReentrantLock();
		// Create a condition
		private static Condition newDeposit = lock.newCondition();
		
		private int balance = 0;

		public int getBalance() {
			return balance;
		}

		public void withdraw(int amount) {
			lock.lock(); // Acquire the lock
			try {
				while (balance < amount) {
					System.out.println("\t\t\tWait for a deposit");
					newDeposit.await();	
					//// Even this one is signaled, it still need to check while condi
				}
				balance -= amount;
				System.out.println("\t\t\tWithdraw " + amount + "\t\t" + getBalance());
			} catch (InterruptedException ex) {
				ex.printStackTrace();
			} finally {
				lock.unlock(); // Release the lock
			}
		}

		public void deposit(int amount) {
			lock.lock(); // Acquire the lock
			try {
				//semaphore.acquire(); // Acquire one permit
				balance += amount;
				System.out.println("Deposit " + amount + "\t\t\t\t\t" + getBalance());
				// Signal thread waiting on the condition
				newDeposit.signalAll();
				//// This signaled all newDeposite lock
			} finally {
				lock.unlock(); // Release the lock
				//semaphore.release(); // Release one permit. Better be in finally
			}
		}
	}
}
