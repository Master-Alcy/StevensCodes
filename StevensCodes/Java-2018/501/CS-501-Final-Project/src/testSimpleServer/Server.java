package testSimpleServer;

import java.net.ServerSocket;
import java.io.IOException;

class Server {
    public static void main(String[] args) throws IOException {
        try( ServerSocket ss =  new ServerSocket(3333)) { // try with resources
            new ServerThread(ss.accept()).start();
        }
    }
}