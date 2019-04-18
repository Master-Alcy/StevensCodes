# Ying Lu Feedback

## Case testing
1. Student sign up
2. Staff sign up
3. Student log in
4. Staff log in
5. Staff book addition
6. Staff book update
7. Staff check book
8. Staff check student(not student name but user name indeed)
9. Staff book rental
10. Staff book return
11. Staff log out
12. Student find book
13. Student check record
14. Student log out

## Case result
The above 14 all functions can work well.

## Improvement opinion
1. 
Case:
    In the sign up page, since we have finished the "Identity" already. 
    From this perspective, when sign up, if a student have the same username as a staff, it could go on as well
    (at now it is "username is taken");
Opinion:
    When log in, just like the sign up page, we coule have 3 question option: "username", "passpord" and "identity".

2. 
Case:
    When excution the "Staff check student" function, the hint is "Checking by student name", but it is student username
    indeed.
Opinion:
    Change "Checking by student name" into "Checking by student username".
    
3. 
Case:
    We could set the return date earlier than rentdate in the "Book Rent/Receive" page of stuff,
    when we go to the "Check Rental Record" page of student then, we could find a student could return a book
    even haven't been borrowed before.
Opinion:
    For the one book, we should add some conditions that the rent date should be earlier than recieve date.
    
## Others
The part of "storage" and "totalStorage" are some kind of confusing.
For example, when I update the storage of book1 from 10 to 90, then go to "Check Book Record", we find the "Storage" changed from 10 to 100, but without any idea of the meaning of this part.

## Summary:
1. Source code, database can run smoothly and work well, without any bug.
2. The features are complete, can implement a system of a library basically.
3. The interface is simple and clear.
4. Slight areas worth improving are not essentially coding blunder, but not match up with daily experience, 
    and can be easily fixed.
