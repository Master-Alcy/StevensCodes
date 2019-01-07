package a_NewQuestions;

public class SmallTests {

	public static void main(String[] args) {
		char[][] grid1 = {
				{'1','1','1','1','0'},
				{'1','1','0','1','0'},
				{'1','1','0','0','0'},
				{'0','0','0','0','0'}
		};
		System.out.println(grid1.length);
		System.out.println(grid1[0].length);
		int i = 6;
		if (i < 3 && grid1[i][0] == '0') {
			System.out.println(i);
		}
	}

}
