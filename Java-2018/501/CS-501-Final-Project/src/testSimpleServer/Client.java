package testSimpleServer;

import java.net.Socket;
import java.io.PrintWriter;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

class Client {
	public static void main(String[] args) {
		try (Socket s = new Socket("localhost", 3333);
				PrintWriter pw = new PrintWriter(s.getOutputStream(), true);
				BufferedReader stream = new BufferedReader(new InputStreamReader(s.getInputStream()));
				BufferedReader write = new BufferedReader(new InputStreamReader(System.in))) {
			System.out.println("In Client");
			String in;
			
			while ((in = write.readLine()) != null) {
				pw.println(in);
				if (in.equals("bye"))
					break;
				System.out.println("Msg 4m server: " + stream.readLine());
			}
		} catch (IOException e) {
			System.err.println("Exception: " + e);
		}
	}
}