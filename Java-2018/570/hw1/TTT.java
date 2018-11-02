package hw1;

//Jingxuan Ai 2018/6/1

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class TTT {
	public static Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) throws IOException, FileNotFoundException {
		System.out.println("Input colume number first then row number.");
		TTT test1 = new TTT();
		test1.getstarted();
	}

	public void getstarted() throws IOException {
		System.out.println("Enter 1 for new game.");
		System.out.println("Enter 2 to resume saved game.");
		
		switch (Integer.parseInt(sc.next())) {
		case 1:
			System.out.println("Input the number of players(Max 26).");
			int playerNum = Integer.parseInt(sc.next());
			System.out.println("Input the numbers of Cols and Rows(Max 999x999).");
			int rowNum = Integer.parseInt(sc.next());
			int colNum = Integer.parseInt(sc.next());
			System.out.println("Input the number of win count(Max 999).");
			int winSequence = Integer.parseInt(sc.next());

			if (checkStart(playerNum, rowNum, colNum, winSequence) == true) {
				Board b1 = new Board(playerNum, rowNum, colNum, winSequence);	//initialize data
				System.out.println();
				drawBoard();
				System.out.println();
				Processgame(Board.startPlayer, false);
			} else {
				System.out.println("Not a valid setup. Game exit.");
				System.exit(0);
			}
		case 2:
			readFromfile();	//set Board, StartPlayer, row, col, playerNumber, WinSequence
			System.out.println();
			drawBoard();
			System.out.println();
			Processgame(Board.startPlayer, true);
		}
	}
	
	public boolean checkStart(int playerNum, int rowNum, int colNum, int winSequence){
		if(playerNum <= 1 || rowNum <= 0 || colNum <= 0 || winSequence <= 1){
			return false;
		}
		if (playerNum > 26 || rowNum > 999 || colNum > 999 || winSequence > 999){
			return false;
		}
		if (((playerNum-1) * (winSequence-1)+winSequence) > rowNum * colNum){
			return false;
		}
		if (rowNum < winSequence && colNum < winSequence){
			return false;
		}
		return true;
	}
	
	public static class Board{		//Initializer and Data Storage
		private static int row;
		private static int col;
		private static int playersNum;
		private static int winSequence;
		private static int[][] boardStatus;
		private static int wonPlayer;
		private static boolean checkWin;
		private static boolean checkTie;
		private static int startPlayer;
		private static String filename;
		
		public Board(final int player, final int row, final int col, final int winS){
			Board.row = row;
			Board.col = col;
			Board.playersNum = player;
			Board.winSequence = winS;
			boardStatus = new int[row][col];
			for (int i = 0; i < row; i++) {
				for (int j = 0; j < col; j++) {
					boardStatus[i][j] = 0;			//Would make 0 shows " " later
				}
			}
			Board.checkWin = false;
			Board.checkTie = false;
			Board.startPlayer = 1;
		}
	}
	
	public void Processgame(int SP, boolean resume) throws IOException {

		while (Board.checkWin == false) { 												// End2: WIN
			for (int person = 1; person <= Board.playersNum; person++) {
				if (resume == true){
					person = SP;
					resume = false;
				}
				System.out.println("Save(S||s), Quit(Q||q), or Continue(C||c)?");
				String choose = sc.next();
		
				if (choose.equals("S") || choose.equals("s")) {							//Save file here
					writeTofile(Board.boardStatus, person, 								//new data
							Board.row, Board.col, Board.playersNum, Board.winSequence);	//base data 
					System.out.println("Save complete. Game exit.");
					System.exit(0);
				} 
				if (choose.equals("Q") || choose.equals("q")) {
					System.out.println("Game exit.");
					System.exit(0);
				}  
				if (choose.equals("C")||choose.equals("c")){
					System.out.println("Player " + person+ "'s turn, input a Col and a Row(ex: 1 1).");
					int rowNum = Integer.parseInt(sc.next());
					int colNum = Integer.parseInt(sc.next());

					if (checkMove(rowNum, colNum) == true) {
						move(rowNum, colNum, Board.boardStatus, person);
						drawBoard();
						Board.checkWin = checkWin(rowNum, colNum,person);			// check win here to update boolean
						if (Board.checkWin == true) {
							break;
						}
						Board.checkTie = checkTie();								// END1: Tie
						if (Board.checkTie == true) { 								
							System.out.println("Tie! Game exit.");
							System.exit(0);
						}
					} else {
						System.out.println("invalid row or col. Game exit.");
						System.exit(0);
					}
				}
			}
		} // out of while loop. Output who win here
		System.out.println("Player " + Board.wonPlayer + " has won. Game exit.");
		System.exit(0);
	}

	public boolean checkMove(int row1, int col1) {
		if (row1 <= Board.row || col1 <= Board.col) {
			if (Board.boardStatus[row1-1][col1-1] == 0) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	public void move(int x, int y, int[][] BS, int P){
		//0 = " ", 1 = "X", 2 = "O", 3,4,5,6,...26 = "Z"
		//P is the P'th player ex: 1st player is "X" = 1.
		BS[x-1][y-1] = P;
	}
	
	public void drawBoard() {
		String cell = "C=>";
		for (int i = 1; i <= Board.row; i++) {
			if (i < 10){
				cell += i + "   ";
			}
			if (i >=10 && i < 100){
				cell += i + "  ";
			}
			if (i >=100){
				cell += i + " ";
			}
		}
		System.out.println(cell);

		for (int c = 1; c <= Board.col; c++) {
			if (c < 10){
				System.out.print(c + "  ");
			}
			if (c >= 10 && c < 100){
				System.out.print(c + " ");
			}
			if (c >= 100){
				System.out.print(c + "");
			}
			for (int r1 = 1; r1 <= Board.row; r1++) {
				//Rewrite int to String here
				System.out.print(swap(Board.boardStatus[r1 - 1][c - 1]));
				if (r1 != Board.row) {
					System.out.print(" | ");
				}
			}
			System.out.println();
			if (c != Board.col) {
				System.out.print("  ---");
				for (int r2 = 1; r2 < Board.row; r2++) {
					System.out.print("+---");
				}
			}
			System.out.println();
		}
	}
	
	public String swap(int raw) {
		if (raw >= 0 && raw <= 26) {
			switch (raw) {
			case 0:
				return " ";
			case 1:
				return "X";
			case 2:
				return "O";
			case 3:
				return "A";
			case 4:
				return "B";
			case 5:
				return "C";
			case 6:
				return "D";
			case 7:
				return "E";
			case 8:
				return "F";
			case 9:
				return "G";
			case 10:
				return "H";
			case 11:
				return "I";
			case 12:
				return "J";
			case 13:
				return "K";
			case 14:
				return "L";
			case 15:
				return "M";
			case 16:
				return "N";
			case 17:
				return "P";
			case 18:
				return "Q";
			case 19:
				return "R";
			case 20:
				return "S";
			case 21:
				return "T";
			case 22:
				return "U";
			case 23:
				return "V";
			case 24:
				return "W";
			case 25:
				return "Y";
			case 26:
				return "Z";
			}
		}
		return "Not a valid player.";
	}
	
	public boolean checkTie(){
		int count1 = 0;
		for (int j = 0; j < Board.col; j++){
			for (int i = 0; i < Board.row; i++){
				if (Board.boardStatus[i][j] == 0){
					count1++;
				}
			}
		}
		if (count1 == 0){
			return true;
		}else {
			return false;
		}
	}
	
	public boolean checkWin(int x, int y, int P){
		//use a loop to check win
		//To make sure count is consistent
		//count set to 0 when an invalid value appear
		//check col
		int countWin = 0;
		for (int i = 0; i < Board.col; i++){
			if (Board.boardStatus[x-1][i] == P){
				countWin++;
				if (countWin == Board.winSequence){
					Board.wonPlayer = P;
					//System.out.println("col win count");
					return true;
				}
			}else{
				countWin = 0;
			}
		}
		//check row
		countWin = 0;
		for (int i = 0; i < Board.row; i++){
			if (Board.boardStatus[i][y-1] == P){
				countWin++;
				if (countWin == Board.winSequence){
					Board.wonPlayer = P;
					//System.out.println("row win count");
					return true;
				}
			}else{
				countWin = 0;
			}
		}
		//check left-up to right-down. Start from x or y. Save for now.
		countWin = 0;
		for (int i = x-1, j = y-1; i < Board.row && j < Board.col; i++, j++){
			if (Board.boardStatus[i][j] == P){
				countWin++;
				if (countWin == Board.winSequence){
					Board.wonPlayer = P;
					//System.out.println("left-up1 win count");
					return true;
				}
			}else{
				countWin = 0;
			}
		}
		countWin = 0;
		for (int i = x-1, j = y-1; i >= 0 && j >= 0; i--, j--){
			if (Board.boardStatus[i][j] == P){
				countWin++;
				if (countWin == Board.winSequence){
					Board.wonPlayer = P;
					//System.out.println("left-up2 win count");
					return true;
				}
			}else{
				countWin = 0;
			}
		}		
		// middle point left-up  to right-down
		int ti = 0;
		int tj = 0;
		for (ti = x-1, tj = y-1; ti >= 0 && tj >= 0; ti--, tj--){
			if (ti == 0 || tj == 0){
				break;
			}
		}
		countWin = 0;
		for (int i = ti, j = tj; i < Board.row && j < Board.col; i++, j++){
			if (Board.boardStatus[i][j] == P){
				countWin++;
				if (countWin == Board.winSequence){
					Board.wonPlayer = P;
					//System.out.println("left-up middle win count");
					return true;
				}
			}else{
				countWin = 0;
			}
		}
		//check left-down to right-up. Start from x or y. Save for now.
		countWin = 0;
		for (int i = x-1, j = y-1; i <= Board.row - 1 && j >= 0; i++, j--){
			if (Board.boardStatus[i][j] == P){
				countWin++;
				if (countWin == Board.winSequence){
					Board.wonPlayer = P;
					//System.out.println("left-down1 win count");
					return true;
				}
			}else{
				countWin = 0;
			}
		}
		countWin = 0;
		for (int i = x-1, j = y-1; i >= 0 && j < Board.col; i--, j++){
			if (Board.boardStatus[i][j] == P){
				countWin++;
				if (countWin == Board.winSequence){
					Board.wonPlayer = P;
					//System.out.println("left-down2 win count");
					return true;
				}
			}else{
				countWin = 0;
			}
		}
		// middle point left-down to right-up
		int tti = 0;
		int ttj = 0;
		for (tti = x-1, ttj = y-1; tti >= 0 && ttj < Board.col; tti--, ttj++){
			if (tti == 0 || ttj == Board.col-1){
				break;
			}
		}
		countWin = 0;
		for (int i = tti, j = ttj; i < Board.row && j >= 0; i++, j--){
			if (Board.boardStatus[i][j] == P){
				countWin++;
				if (countWin == Board.winSequence){
					Board.wonPlayer = P;
					//System.out.println("left-up middle win count");
					return true;
				}
			}else{
				countWin = 0;
			}
		}
		return false;
	}
	
	public void writeTofile (int[][] b5, int player, int row, int col, int pN, int winC) throws IOException{
		StringBuilder buildS = new StringBuilder();
		for (int j = 0; j < b5[0].length; j++){
			for (int i = 0; i < b5.length; i++){
				buildS.append(b5[i][j] + "");		//append to output string
				if (i < b5.length - 1){
					buildS.append(" ");
				}
			}
			buildS.append(" ");
		}
		System.out.println("Input file name (ex: 'save1', do NOT followed by '.txt'): ");
		Board.filename = sc.next();
		BufferedWriter outData = new BufferedWriter(new FileWriter(Board.filename+".txt"));
		outData.write(player+" "+ row + " "+ col + " " + pN + " "+ winC + " ");
		outData.write(buildS.toString());
		outData.close();
	}

	public void readFromfile() throws IOException, FileNotFoundException{
		System.out.println("Input file name (ex: 'save1', do NOT followed by '.txt'): ");
		BufferedReader readS = new BufferedReader(new FileReader(sc.next()+".txt"));

		Scanner scRead = new Scanner(readS);
		int row = 0;
		int col = 0;
		int pN = 0;
		int winC = 0;
		
		if (scRead.hasNext()) {
			Board.startPlayer = Integer.parseInt(scRead.next());	//send started player
			row = Integer.parseInt(scRead.next());				
			Board.row = row;										//send row
			col = Integer.parseInt(scRead.next());
			Board.col = col;										//send col
			int[][] arr = new int[row][col];
			Board.boardStatus = new int[row][col];
			pN = Integer.parseInt(scRead.next());
			Board.playersNum = pN;									//send players' number
			winC = Integer.parseInt(scRead.next());
			Board.winSequence = winC;								//send win count
			
			while (scRead.hasNext()) {
				for (int j = 0; j < col; j++) {
					for (int i = 0; i < row; i++) {
						arr[i][j] = Integer.parseInt(scRead.next());
					}
				}
			}
			Board.boardStatus = arr;								//send board
		}
		readS.close();
		scRead.close();
	}
}