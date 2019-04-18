/**
 *  We will fully explore cookie based authenticationin a later section.
 *  Some other common authentication strategies:
 *  ◦Token based authentication; passing an API token in 
 *      the querystringto validate that you are a particular user
 *  ◦Basic Access Authentication; 
 *      providing a username and password on every HTTP request
 *  ◦JWT Tokensbeing used for authentication
 */
//Authorize: verifying what user is currently operating in a system
/**
 * For example, let us say that there are two routes on the server, 
 * /SubmitGradesand /SeeClassesInSemester. 
 * Let us say Faculty can access /SubmitGrades, 
 * and Students or Faculty can see /SeeClassesInSemester
 * To the /SubmitGradesroute, you would apply the following middlewares:
 * ◦One to authenticate the user; 
 *     if no user is authenticated, respond with a status code of 403
 * ◦Next, to check if the user is a faculty member; 
 *     if not, respond with a status code of 403
 * To the /SeeClassesInSemesterroute, you would apply the following middlewares:
 * ◦One to authenticate the user; 
 *     if no user is authenticated, respond with a status code of 403
 * ◦Next, check if user is faculty or a student; 
 *     if not, respond with a status code of 403
 * While authentication handles who you are, 
 * authorization is the process of validating what you can access
 */
//Cookies: 
/**
 * HTTP Cookie is a small piece of data shared between server and client.
 * 1. Can be read or set in client or server
 * 2. Ultimately, sent back and forth as string data
 * 3. Sent through headers.
 * 4. Cannot be deleted, but can be expired (automaticly removed after that)
 * 5. Cookies will be sent back to the server on REQUEST automatically
 * Only new or updated cookies will be sent in a RESPONSE.
 * 6. Cookies are a browser concept, not really for programmatical things.
 */
/**
 * cookie-parser middleware parse the cookie to object
 */
"use strict";
document.cookie = "key=value";
//re-assigning simply add to list of cookies
document.cookie="key=value;expires=1970";
//expire it to delete it

/**
 * user login system: 
 * ◦You will use a combination of data in order to identify a user.
 * There are many other forms of authentication in web technology:
 * ◦You can make an authentication system that allows you to 
 * limit API Access
 * ◦Force users to have a token
 * ◦Allow users a certain number of access hits a month
 * ◦You can selectively allow or dis-allow access to 
 * resources based on user login state
 * several steps:
 * 1. Creating and storing users
 * 2. Allowing users to login via a form
 * 3. Storing session data in a cookie
 * 4. Validating the data stored in the cookie
 * 5. Storing the user as part of the request object.
 */
/** 1. (bcrypt_usage.js)
 * you’ll be storing in a very specific way
 * ◦First off, you will never store a plaintext password. 
 * You will be using the bcrypt package in order to create 
 * a hash of the password
 * ◦For the sake of authentication, you’re going to be 
 * adding an array for users that will keep track of multiple 
 * session identifiers. These session identifiers will allow 
 * you to keep track of logged in browser sessions
 * You will need to create a form to allow users to signup, 
 * where you will need to check for:
 * ◦Duplicate username / emails / other non-duplicatable data
 * ◦Existence of passwords
 */
/** 2. 
 * You will need to setup a form that allows users to POST their 
 * username and password to a route.
 * This route will need to validate the username and password 
 * provided against entries in the database.
 * ◦You will retrieve the user with that matching username
 * ◦You will use bcryptto compare if their supplied password 
 * is a match to their hashed password
 * If there is a match, you can proceed; if not you will simply 
 * allow the request to continue.
 */
/** 3.
 * If the user logged in with proper credentials, 
 * you will then create a session id!
 * This session id should be some sort of very long identifier, 
 * such as a Guid. We store a session id so that the 
 * username or password cannot be intercepted.
 * This session id will be passed to the user via-cookie and will also 
 * be stored as one of many session ids on the user in the database. 
 */
/** 4.
 * Make middleware at this stage:
 * Run on each stage, check for the cookies containing a session ID
 * ◦If there is a match, you’ve found your user!
 * ◦If not, your request is coming from an unauthenticated source; 
 * expire their cookie.
 */
/** 5.
 * In middleware, we can access req/res. For the user associated with
 * a session id, we may define a property on the req/res object that
 * stores the user or its representation.
 * This data will be accessible:
 * 1. In middleware that are defined after the authentication mid
 * 2. In our routes
 * Note that we can attach middleware to particular paths(/user)
 * and, if a user is not logged in we can redirect them. Or check
 * path to see if a user have the permission to access, redirect if not.
 */
/** Logging out
 * 1. After hitting a logout route, you will expire the cookie for
 * the session id.
 * 2. you will remove the session id from the user's seession id list
 * 3. Invalidate any other cookies that are relevant to the user
 */