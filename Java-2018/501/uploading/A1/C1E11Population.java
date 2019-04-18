
public class C1E11Population {

	public static void main(String[] args) {
		final double currentPopulation = 312032486;
		final double secsInYear = 365 * 24 * 60 * 60;	//days, hours, mins, secs
		double displayPopulation = 0;
	
		System.out.println("This year's population is: " + 
		(int)Math.floor(currentPopulation));
		
		
		for (int i = 1; i <= 5; i++){
			displayPopulation = currentPopulation +
					i * secsInYear / 7.0 - 
					i * secsInYear / 13.0 + 
					i * secsInYear / 45.0;
			System.out.println("Next " + i +" year's population is: " +
					(int)Math.floor(displayPopulation));
		}
	}
}