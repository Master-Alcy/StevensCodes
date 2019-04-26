# Some Basic Design

## A blog about group people up and play

People come here and set up their profile.
Then group up under activities including swimming, hiking, bar, traveling, or any custom topics.
Potentially we can use their profile to advise them some topics or chatroom they might be interested.

* Home Page (Need to be fancy)
  * **Category Tags**
  * Statics of our users and Graph for them
  * A list of all blogs ranked by most recent reply
  * A container of all ongoing real time chatting
* Profile Page
  * Avatar / UserName
  * Gender / Age / Residency / Job / Interests
  * Show their notifications, historical blogs and comments in three groups
  * Note that Header component should support notifications look up.
* Category Page
  * A link to Real Time Chatting room
  * Show all articles and chatrooms with this category
* Blog Page
  * A normal article with permanent comments
  * Comments
    * Like (used for ranking)
    * User can edit it anytime
    * Username, date
    * I hope this can support reply and we notify that user somehow
* Real Time Chatting Page
  * This would be splitted into different categories as well
  * Could be started as a button in header, then choose category in a drop down menu
  * Listed both in home page and category page. Ranked by most recent reply and number of people

## Tech Stack

* Front-End stuff
  * React.js
  * ImageMagick
* Middlewares
  * Firebase Auth
  * ElasticSearch
* Back-End
  * Redis
  * Mongoose for MongoDB