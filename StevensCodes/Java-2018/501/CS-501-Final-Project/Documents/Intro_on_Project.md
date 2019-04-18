# A Finace Data Acquiring System

## The Idea

This is basicly combining some final project suggestions together. Instead of real time internet data, I used "call by need" data and naturely insert them into database. The client and server are communicating based on TCP/IP traversal using java.net. Each server can handle multiple clients with a database. The user can ask a Symbol of a company on stock market in client, and the server will query database to find it first, if none found, crawl the internet and get back data, send back to client while store them in database in case of next query.

## My Building Process

* First, I used MySQL as database to store all data, the quotes' records and companies' list are reffering tables with a int(6) owner field in quotes.  
* Then I implemented a web crawler to get data from yahoo.finance's history tab and get part of the data. Yahoo is using react there so I don't know how to get full set of history data. As for current data, yahoo and google both make their Api Charging money and hard for a student to access.  
* In process of setting up all querys and updates to database I am getting familiar with MySQL. After that I started to build my server and client. I was trying to build with JavaFX but I encoutered many bugs in the proccess of combining server and client, thus, I choose to use console for now.  
* MultiThreadingServer is achieved simply with a while loop over 'new ServerThread(serverSocket.accept()).start();'.

## Structure of the Code

1. Setup.java: Setting up database.
2. Server.java: Start a new thread on client request. Should be able to handle multiple clients as shown in video.
3. Client.java Query the Server with Symbol and get history data back.
4. ServerThread.java This is the thread the Server is running.
5. QuotesCrawler.java A Jsoup web crawler get data from yahoo.finance.
6. DataBase.java Handles all operations related to database. I used MySQL 8 here, for different version probally different driver is needed.

## Some More Ideas for Future Development

Well, I know there are tons of similar apps out there, but this one is a good practice for me.  

* First of all, I can try to use JavaFX to implement the Clients. The data should appear both in table and graphs. I also want to operate some date to see if the slope is positive or else.  
* Second, for real app I think I need to have current stock price. This can be achived by learning Google's and Yahoo's Api.  
* Third, the server should be able to update old history data everyday.
* I used REFERENCE key word in MySQL but I didn't find a good way of using it.