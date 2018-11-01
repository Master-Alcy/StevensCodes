package two;

public class TestStatic {
	static int i = 10;
	
	@SuppressWarnings("static-access")
	public static void main(String[] args){
		i ++;
		TestStatic.i ++;
		TestStatic a = new TestStatic();
		TestStatic b = new TestStatic();
		System.out.println(a.i);
		b.i ++;
		System.out.println(b.i);
		Increase.inc();
		System.out.println(i);
	}
}

class Increase{
	static void inc(){
		TestStatic.i++;
	}
}
