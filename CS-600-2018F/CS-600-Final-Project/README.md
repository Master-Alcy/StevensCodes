# Simple Search Engine

The idea is craw alone the websites, insert all text data (Excluding HTML) 
into my compressed trie data structure. This may take some time depending on 
the number of websites and the amount of data. Then search the trie and 
get data. A short video contains a testing video.

## Index of Full Document

1. Simple Search Engine
2. Index of Full Document
3. Compile and run
    1. JSoup
    2. Javac
    3. For Node.js on Windows
    4. For Windows Console
    5. For Mac's Console
    6. Eclipse Alternate
4. My Approach to Problem
    1. Main.java
    2. MyCrawler.java
    3. MyPrinter.java
    4. MyCompressedTrie.java
    5. MyTreeMapByValue.java
    6. MyProcessor.java
5. Testing on Boundary Conditions
6. Some Analyzing on Complexity
    1. Time Complexity
    2. Space Complexity

## Compile and run

The Un-Ziped 600FP.zip should contain ten files:  
Six .java, one .jar, one .json, one .md, and one .log

### JSoup

Using JSoup as external library. Library commands is in following url:  
https://jsoup.org/cookbook/introduction/parsing-a-document

### Javac

Need javac to compile and java to run. Detailed steps in next 3 tabs, 
then the IDE alternate tab.

### For Node.js on Windows

In folder's path, enter:  
npm run build  
npm start

### For Windows Console

In folder's path, enter:  
javac -cp *.jar *.java  
java -cp jsoup-1.11.3.jar;. Main

### For Mac's Console

In folder's path, enter:  
javac -cp *.jar *.java  
java -cp jsoup-1.11.3.jar:. Main

### Eclipse Alternate

File > new > Java Project > whatever project name with jdk1.8.0_144 or
something similar > finish > right click on this project > import >
File System > Enter directory of my folder > import all non .java files
into project folder > import again from the same path but all .java files
into project folder/src > right click on project again > Build Path >
Add External Archives > add the jsoup-1.11.3.jar in project folder >
open Main.java > run as java application

## My Approach to Problem

For maintenance's sake, I seperated all functional methods into six parts. Note that 
not all methods are listed down below. For more information just look at the code 
directly.

### Main.java (Asker Class)

This class only have one method called Asker, which is doing what it is to 
keep promot user to query against the program.

#### private static void Asker(){...}

In my ask1 while loop, I am asking for the starting url and craw 
limit for my crawler like:  

~~~
Enter your url in line one and craw limt in line two.
If you enter one "0" in first line you will enter default mode.
Default URL: https://www.rainerhahnekamp.com/en/ignoring-exceptions-in-java/
Default craw limit: 50
~~~~~~~~~~~~~Craw and Data Insertion~~~~~~~~~~~~~~~~~
Craw: https://www.rainerhahnekamp.com/en/ignoring-exceptions-in-java/
Craw: https://www.rainerhahnekamp.com/en/ignoring-exceptions-in-java/#content
Craw: https://www.rainerhahnekamp.com/en/
~~~
...
~~~
Craw: https://www.rainerhahnekamp.com/en/tag/jackson/
Craw: https://www.rainerhahnekamp.com/en/tag/jacoco/
Craw: https://www.rainerhahnekamp.com/en/tag/java9/
----------- We visited 50 URLs -----------
All data inserted by now. Begin searching: 
~~~~~~~~Finished and Starting Search Engine~~~~~~~~~~
~~~

In my ask2 while loop I am asking for a string to search. This string could 
be any because I will process it into the acceptable form and may print out 
exception if is not a legal string. Then the result would be in the form like:  

~~~
==============================================
Enter search string in one line, and "qqq" to exit 
Empty search word. Maybe you entered a stopword.
==============================================
Enter search string in one line, and "qqq" to exit 
Word "aaaaaaaaaaaaaaaaaaa" not found.
==============================================
Enter search string in one line, and "qqq" to exit 
Word "mock" not found.
==============================================
Enter search string in one line, and "qqq" to exit 
Searched against: file 
Total occurence: 12
Rank 1: http://www.baeldung.com/java-lambda-exceptions
All words' total occurences on this site is: 3
Rank 2: http://www.informit.com/articles/article.aspx?p=2171751&seqNum=3
All words' total occurences on this site is: 2
Rank 3: https://www.rainerhahnekamp.com/en/qcon-london-2018/
All words' total occurences on this site is: 1
Rank 4: https://github.com/rainerhahnekamp/sneakythrow
All words' total occurences on this site is: 1
Rank 5: https://github.com/vavr-io/vavr
All words' total occurences on this site is: 1
Rank 6: https://projectlombok.org/features/SneakyThrows
All words' total occurences on this site is: 1
Rank 7: https://www.rainerhahnekamp.com/en/5-pillars-of-learning-programming/
All words' total occurences on this site is: 1
Rank 8: https://github.com/rainerhahnekamp/ignore-exception
All words' total occurences on this site is: 1
Rank 9: https://github.com/pivovarit/ThrowingFunction
All words' total occurences on this site is: 1
This search ends.

==============================================
Enter search string in one line, and "qqq" to exit 
Program fully exit.
~~~

### MyCrawler.java (Web crawler)

This class crawls any internet sites, but note that most modern sites have 
many protection methods and authorizations. My crawler is just to crawl and 
get some data to test my program and is not meant to nor could it to get 
any sensitive data from any protected sites. For testing's sake, I provid a 
default URL and default crawl limit.

#### public static void crawler(String url, int limit) {...}

This is the only public method in this class and just take the URL and crawl 
limt and search from that URL and all sub URLS contained. In the same time, 
all data got from JSoup's Jsoup.connect(URL).get().text() is sent to my 
processor class as string.

#### private static ArrayList<String> getSubURLs(String currentURL) {...}

This class only use Jsoup's Jsoup.connect(URL).get().select("a[href]") to 
get all links' elements and add all sub URLS to a list to be returned.

### MyPrinter.java

This class can print both to console and a file "console.log" in the same folder, 
which makes the data of the output saved for later use such as: debugging nad data 
analyzing.

### **MyCompressedTrie.java (Core Class)**

For simplicity, this Trie only allows a-z because I processed all words before 
insertion and make them all to lower case. The benifit is that my node only need 
to be size of 26 instead of 256 (ASCII full size).  
As a Compressed Trie, all data is inserted as edges between nodes, the node only have 
a wordCount to count the words ended in this node. 0 for no word and else for 
do have word. I use StringBuilder instead of String for edges because this would 
save some time.  
This class only have two method as public and all data are declared as private.

#### public void insert(String word, String url) {...}

This is the entrance to call a private method: insert(root,word, url, 0, 0) like 
a setter which described four cases:  
* Insert a new word for a new node  
* Insert a new word when a node contains the prefix of this word  
* Insert a new word when a node contains this whole word exist  
* Insert a new word when a node contains part of this word's prefix  
Note that there are two helper functions to help put data in and rebuild the 
string.

#### public HashMap<String,Integer> get(String word) {...}

This function get node returned from the private get function and get the HashMap 
stored inside and out the wordCount from the node into the return HashMap, too. 
In this way I can get both data from HashMap (url and occurence) and the Integer 
total word count. The function is handling four cases:  
* Word not exist  
* Word is a prefix of in the whole word in this chain of nodes  
* The word exist in chain of nodes is just a prefix of searched word  
* Only the prefix of this word exist  

### MyTreeMapByValue.java

This function only change the normal Tree map's comparator from comparing 
keys to values. This is only applied before final data print out for the 
time complexity of insertion is O(logn).

### **MyProcessor.java (Core Class)**

Similarly, this class only have two public class and all other functions and data 
are declared private. This class does two things: process raw data then inserting 
into Trie and do the searching.

#### private static String cleansing(String page) {...}

This one used both before inserting into Trie and before search from Trie. It cast all 
string into letters in lowercase without stop words.

#### public static String searchEngine(String input) {...}

Search against Trie and get the HashMap from it and cast into TreeMap for ranking. 
It saves some time in inserting data but do slower than save as TreeMap in the first 
place. Since the amount of data searched is way smaller than what is inserted, I suppose 
this is a more efficient approach in my case.

## Testing on Boundary Conditions

As Indicated in **private static void Asker(){...}**, the boundary conditions are:  
* Invalid URL
* Invalid crawl limit
* Invalid searching.

The URL Exception would carry on with no data inserted until search session. Then 
user can enter qqq to exist.  

Similarly, when crawl limit is smaller than 1, no data would be inserted but the 
program would carry on to next session.  

The successful crawl would be a log says "Craw: URL" and no Error message shown.  

The searching validation is as described in previous session:  
* Empty Search Word or Only Stop Words
* Word Not Found

## Some Analyzing on Complexity

### Time Complexity

The speed of search for url and getting data is controled by Jsoup functions and 
internet speed. The data insertion is in path with each URL into the HashMap in 
Trie structure.  

For each insertion, in other word, one word, the time complexity is O(m), where m 
is the length of the word inserted. For n words, the insertion would cost O(nm). 
Note that I didn't count the time for transforming words into the form acceptable 
for the Trie. In more complex Trie, I can use a Node capacity of Full ASCII 
Size (256) instead of a-z (26) to avoid this processing time, but since my search 
engine does not need to support non-letters I ignored this case.  

Also the url and its occurence for each word is stored as HashMap, since the 
insertion for HashMap only cost O(1), which make data insertions a lot faster 
considering the large amount of data. The time for re-arranging the data into TreeMap 
is O(logn) but searching operation is a lot less than the times of data insertion.  

### Space Complexity

The Compressed Trie Structure uses way smaller space than the normal Trie Structure. 
The data in HashMap is seperated at each node of the Trie, and we can store all them 
in seperated disk easily. All heavy space consuming data are stored in the 
MyCompressedTrie Class and thus easier for further usage and storage. The only place 
called the MyCompressedTrie is the MyProcessor class, which means the Trie only exist 
when we need to use MyProcessor, after that all data is marked as dump.