# Final Project Design

I want to make a stock GUI client and a server with database. The idea is server craw stock data from a website and somehow store in database. The client can access the database can view the data.

## Some ideas

I better start wih building a crawler to get data needed

1. Craw stock data from website (I think delayed data is ok)
    1. <https://stackoverflow.com/questions/45405420/how-can-i-get-the-stock-price-volume-from-finance-yahoo-com>
    2. <https://introcs.cs.princeton.edu/java/31datatype/StockQuote.java.html>
    3. <https://stackoverflow.com/questions/20040925/jsoup-stock-quote-scraping-yahoo-finance>
    4. Video: <https://www.youtube.com/watch?v=tI1qGwhn_bs>
2. Store in database in some formate:
    1. Symbol
    2. Price
    3. Company Name
    4. Date
3. Client can operate with the data:
    1. See the prices, symbols and names stored in the order of date
    2. get the slope of prices to see if it's raising or not with custom range
    3. A todo List with a name and note

## Chapters / Exercise / Topics

All the preparation needed to start this project.  
I feel it's better to read through all chapters then pick some exercises that could be useful.  
The day I wrote this draft is at the night of **12/7**, the due date is ***12/20***. I need to speed up.  

### Chapters

10, 14, 15, 31, 34, 35  

### Exercise

* 34.1-2, 4-5 – Section 3 is on SQL  
* problem set in chapter 14 and 15  
* 31.1/3 on p1169 or 31,9-10 on p1171
* 9.2

### Topics

#### Database Programming

Targeted to MIS students but anybody can do this. The data in instances of Java classes can be collected and implemented as relational database tables. This more fully developed Chapters 34 and 35 available from the Companion web site. For this project, it is enough to set up the three tables for Course, Student, and Enrollment and implement the programs in Listings 34.1 through 34.3 (really one program with several enhancements) in such a way that the programs can be tested. The basic Course class is in Section 10.5 with Exercise 10.9. Provide brief instructions for the user.

#### Computer Graphics and Animation

Use one or more of the exercises in Chapters 14 and 15 to explore computer graphics and animation. These are the beginning of computer game development.
Write a short report on what you did. Include the code and provide a set of instructions for me to test your code.

#### Network Programming

This project involves communications between clients and servers simulating interaction across a network (although for this project both can be on the same computer). It involves creating GUIs on the client, (and also on the server if only to monitor the interactions), TCP/IP protocols, and streaming I/O from one to the other. An application is a Chat facility.

#### Internet Access

"Real time" access to the Internet allows users to get timely information and interact with ongoing events. Many are possible, one suggestion in the text is the following:
Exercise 9.2 ask for a Stock class with only predefined and compiled data. Java classes at StockQuote.java on the Internet may provide a program to get a quote at the time the program is run. Follow the imports and downloads carefully. Provide for exceptions.