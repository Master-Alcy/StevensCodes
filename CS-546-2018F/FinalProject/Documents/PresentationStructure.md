# Prepare for Project SUbmission

## Final Project Code Requirement

Each group will provide a copy of their final project's code, and a database dump / seed task.

* ~~Code Quality~~
* ~~Use of Client-Side JavaScript~~
* ~~Use of Server-Side JavaScript~~
* ~~Use of MongoDB~~
* ~~Project Goals delivered~~
* ~~Security measures~~
* Use of valid HTML and CSS
* Accessibility
* ~~Only requiring database credentials to be updated in one file.~~

## Final Code Submission Requirement

You will submit a zip archive that contains:

* The directory with the final project (done)
* A readme describing how to setup and use your project (done)
* A seed task to seed your database with relevant data (done)

## Requirement for Final Project Presentation

All students will submit a video file on Canvas for their final project presentation.
You will give a presentation demonstrating your product and discussing its technical background.
You will go through your product and demonstrate it in its entirety; all deliverable goals, the
entire process of using it, and so on. You will discuss any outside code that you used (i.e.,
frontend frameworks and libraries), as well as why you used said technologies.
This video should be 10 to 15 minutes long.

### Brief

* Demonstrating product and its technical background
* Go through entrie website
* Describe all deliverable goals
* Entire process of using it
* Mark the outside code (frontend frameworks and libraries) and why
* 10-15 mins

## Structure of Final Presentation

1. Introduction on the purpose of website
    1. We want to build a website to manage a library.
    2. For staff, handle all book operations and update/check records.
    3. For student, check his/her records and search the book he/she want.
2. Routine
    1. Home Page
        1. Guide can be removed
        2. Show hours and news. Could be filled for real world usage
    2. Sign up a student and a staff
        1. Name validation
        2. Password validation
        3. The identity should be test with student university id and staff university id. We make it as selection just for easier testing purpose.
        4. Show if a username exists and not all fields filled, block sign up.
        5. If success, auto re-direct
    3. Login as a staff
        1. Show same validations
        2. Show password is not match
        3. Show username is not found
        4. Say then auto re-direct
    4. Staff Page
        1. Give a brief on what each module does
        2. Click Bookstorage
    5. Bookstorage Page
        1. Read Standard book then use add
        2. Show how require works
        3. Then show how to add another book
        4. Go back
        5. Update book
        6. Describe how storage number works
        7. add one, then go to bookinteraction
    6. Bookinteraction Page
        1. Rent out two, then receive two
    7. Checkstudent Page
        1. using student's username
        2. Show that staff's username would not return
    8. Checkbook Page
        1. Show that check book by title could return all books' records with the same title
        2. Same for check by ISBN and check by key words
        3. May describe how different return type is handled. (Return as Books or a book)
    9. Log out (Back to Home)
        1. Test authentication as guest
        2. Login as staff and test authentication
        3. Login as student and test authentication
    10. Student Page
        1. Brief into, mark that profile is extra
        2. Go to check Record Page first and say that it is tested with session id automaticly
        3. Go to find book page and do the same as satff search book but comment how the data returned is different
3. Goals. Describe how we completed all of them
    1. Core:
        1. User function:
            1. sign in:
                1. two types: student, staff
                2. user name
                3. check valid password(AJAX) (Implemented as Jquery.ajax)
            2. log in:
                1. user name
                2. password (AJAX) (Implemented using react's fetch)
        2. Studnet function:
            1. search books
            2. check records
        3. Staff function:
            1. add new books
            2. remove old books
            3. rent books to students
            4. receive returned books
            5. check students’ record by student id or name (Implemented by username)
            6. check book rental record and storage (full list)
4. Introduction on the technical background
    1. Client side React routes handle all get requests
    2. Client side React also make all style and rendering
    3. Using semantic-ui as Frontend library for easier development
    4. Using Mongoose to struct mongodb for it's ability to build model.
    5. Server side routes handle all post request from client what we learned.
    6. Else just the express and javascript we learned from lectures.
5. Finally, describe why using react and semantic-ui
    1. Using react can rendering things using seperated components, which makes development on each module clearer
    2. React can update state with each render, which makes it possible to update states in page and inner functions can perform against current state.
    3. It's possible to transform everything we did in react to normal javascript and handlebars, but it would make code less readable, more scattered, and need to write a lot more code.
    4. semantic-ui is a light weight ui design pack which is normal HTML with style attached. We developed 11 pages with different functions of showing Segment, Header, Divider, List, Input, Loader, Grid, Form, Button and so much more. It would take tremendous work and experience to build proper functional CSS, thus we choose to use existing UI library.
    5. semantic-ui do have Shown CSS Style which can be used for adjustment to certain properties. If we want to change style in the future, we can do that.
6. Conclusion
    1. Nodemon and webpack helps a lot in developing website or web app
    2. Since it's hard to group all of teamates together everyday, the usage of github and VSCode Live are critical.
    3. The ability to write markdown documents are also important
    4. Testing website is extremely important to find bugs and place to be improved. Thus we use ./Document/Feedback.md for people to give their feedbacks and ChangeLog.md to say if things are fixed or unhandled and why