import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

public class Spider {
	private static final int MAX_PAGES_TO_SEARCH = 20;
	private Set<String> pagesVisited = new HashSet<String>();
	private List<String> pagesTOVisit = new LinkedList<>();
	
	public void search(String url) {
		while(this.pagesVisited.size()< MAX_PAGES_TO_SEARCH){
			
			String currentUrl;
			SpiderLeg leg = new SpiderLeg();
			
			if(this.pagesTOVisit.isEmpty()){
				currentUrl = url;
				this.pagesVisited.add(url);
			}
			else{
				currentUrl = this.nextUrl();
			}
			System.out.println("Start to crawl: "+currentUrl);
			leg.crawl(currentUrl); 
			
			this.pagesTOVisit.addAll(leg.getLinks());
		}	
	}

	private String nextUrl(){
		String nextURL;
		do{
			nextURL = this.pagesTOVisit.remove(0);
		}while(this.pagesVisited.contains(nextURL));
		this.pagesVisited.add(nextURL);
		
		return nextURL;		
	}
}