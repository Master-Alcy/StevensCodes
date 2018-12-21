package testSimpleServer;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;


public class ServerThread extends Thread {
    Socket s = null;

    public ServerThread(Socket s) {
        super("ServerThread");
        this.s = s;
    }

    public void run() {
        try( PrintWriter pw = new PrintWriter(s.getOutputStream(), true);
                BufferedReader stream = new BufferedReader(new InputStreamReader(s.getInputStream()));
                            ) {
            System.out.println("In Server");
            String in;
            while ((in = stream.readLine()) != null) {
                System.out.println("Msg 4m client: " + in);
                if(in.equals("bye"))
                    break;
                pw.println(in+"Processed");
            }

        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}