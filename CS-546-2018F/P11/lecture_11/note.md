# Notes on Lecture 11

jQuery library is exported in $

## all HTML submitted must pass tota11y tests

TOTA11Y: <http://khan.github.io/tota11y/>

## Basic CSS selectors

~~~HTML
<h2>MyName Is <span class=“my-name”>Phil</span></h2>  
<mainid=“my_bio”>This is a test <h2>I love blogging</h2></main>  
~~~

Id: #my_bio

~~~HTML
<mainid=“my_bio”>This is a test <h2>I love blogging</h2></main>
~~~

Class: .my-name

~~~HTML
<span class=“my-name”>Phil</span>
~~~

Elements: h2

~~~HTML
<h2>MyName Is <span class=“my-name”>Phil</span></h2>
<h2>I love blogging</h2>
~~~

Combinations: #my_bio h2

~~~HTML
<h2>I love blogging</h2>
~~~

### Other APIs

* SessionStorage API: in page session  
* LocalStorage API: across page views  
* Audio/Video API  
* Canvas API: HTML5 feature: draw graphics via scripting in JS.
* Or even photo, animation, real-time video processing or rendering  
* Geolocation: get user's location  

## Accessibility

* Headings (h1) should rank down one by one: h1 => h2 => h3
* Contrast ratio should be just fine
* A link's text should be meaningful
* Inputs should come with Label for screen reader to parse.

~~~HTML
<label for="my-input">
    Label text here...
</label>
<input id="my-input">

<label for="email-input">
    Label text here...
</label>
<input id="email-input" placeholder="input@example.com">
~~~

* Image need an alt attribution

~~~HTML
<img src="./img/toy-car.jpg" alt="Image description">
<!-- Below cases for decorative pictures -->
<img src="./img/toy-car.jpg" alt="">
<img src="./img/toy-car.jpg" role="presentation">
~~~