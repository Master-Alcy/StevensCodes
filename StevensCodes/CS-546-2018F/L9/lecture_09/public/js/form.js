(function () {
  //run instantly for functional scope
  //dont to be too heavy
  const calculatorMethods = {
    /*
    Some common things to check for:
    ◦Check if this input is required and if so, check if it has a value
    ◦Check if the input is within an acceptable range
    ◦Check if the input is within some other criteria 
    (ie: is a password that has certain properties)
    If an input is bad, you will prevent the form from submitting 
    and add some sort of error message.
    */
    add(num1, num2) {
      if (typeof num1 !== "number") throw "Must provide a number";
      if (isNaN(num1)) throw "Must provide a number";
      if (typeof num2 !== "number") throw "Must provide a number";
      if (isNaN(num2)) throw "Must provide a number";

      return num1 + num2;
    },
    subtract(num1, num2) {
      if (typeof num1 !== "number") throw "Must provide a number";
      if (isNaN(num1)) throw "Must provide a number";
      if (typeof num2 !== "number") throw "Must provide a number";
      if (isNaN(num2)) throw "Must provide a number";

      return num1 - num2;
    },
    multiply(num1, num2) {
      if (typeof num1 !== "number") throw "Must provide a number";
      if (isNaN(num1)) throw "Must provide a number";
      if (typeof num2 !== "number") throw "Must provide a number";
      if (isNaN(num2)) throw "Must provide a number";

      return num1 * num2;
    },
    divide(num1, num2) {
      if (typeof num1 !== "number") throw "Must provide a number";
      if (isNaN(num1)) throw "Must provide a number";
      if (typeof num2 !== "number") throw "Must provide a number";
      if (isNaN(num2)) throw "Must provide a number";
      if (num2 <= 0) throw "Cannot divide by 0!";

      return num1 / num2;
    }
  };//calc ends

  function operationStringToFunction(operation) {
    if (!operation) throw "No operation provided";

    const returnFunction = calculatorMethods[operation];

    if (returnFunction === undefined) throw "No such operation";

    return returnFunction;
  }//What does this function do?

  //get the staticForm handlebars
  const staticForm = document.getElementById("static-form");

  if (staticForm) { //the rest of this self-called function is this
    /*We can store references to our elements; it's better to store them 
    once rather than re-query the DOM traversal each time that the event runs.
    */
    /*
    Many methods for DOM elements:
    ◦document.getElementById(“content”);
    ◦document.getElementsByTagName(“li”);
    ◦document.getElementsByTagName(“div”);
    ◦document.querySelector("div");
    ◦document.querySelectorAll("div > a");
    查找每个父元素为 <div> 的 <p> 元素，并为其设置背景颜色:
      var x = document.querySelectorAll("div > p");
      var i;
      for (i = 0; i < x.length; i++) {
        x[i].style.backgroundColor = "red";
      }
    When we have an initial reference to a DOM node, we can also traverse 
    its children to access other DOM nodes. You can store these results in 
    a variable! It is often beneficial to do so, to avoid many DOM 
    traversals, which is relatively slow and expensive operation.
    */
    const firstNumberElement = document.getElementById("number1");
    const secondNumberElement = document.getElementById("number2");
    const operationElement = document.getElementById("operation");

    const errorContainer = document.getElementById("error-container");
    const errorTextElement = errorContainer.getElementsByClassName(
      "text-goes-here")[0];

    const resultContainer = document.getElementById("result-container");
    const resultTextElement = resultContainer.getElementsByClassName(
      "text-goes-here")[0];

    /*We can take advantage of functional scoping; 
    our event listener has access to its outer functional scope. 
    This means that these variables are accessible in our callback*/
    /*
    In order to listen for an event, first you must:
    ◦Target a DOM element
    ◦Call the addEventListenermethod on that, 
          and supply the the following as parameters:
          ◦Event name
          ◦Callback function
    The callback function will receive an object 
    representing the event as its first parameter
    */
    /*
    For example, if you had two divelements, each with an event listener 
    listening for the click event, and clicked the inner div, which event 
    should the DOM trigger?
    By default, it will trigger the inner div first, then the outer div.
    You can prevent the event from bubbling past the first divby using 
    the stopPropogationmethod on the event object, which will be passed 
    into the event listener via the first parameter.
    */
    staticForm.addEventListener("submit", event => {
      //all callbacks till the end
      /* 
      After querying a DOM element, you will be able to access 
      tons of data based on the type of element.
      ◦All elements will allow you to get/set their innerHTML
      ◦All elements will allow you to get/set their children
      ◦All elements will allow you to get/set attributes, classes, width, height, etc.
      ◦Inputs will allow you to get/set their values
      You will also be able to hook into events related to some element types
      ◦Inputs have events for when they change
      ◦Images will allow you to watch for the image loading / failing
      ◦Forms have events for submissions 
      */
      /*
      Client-Side Form Validation
      The process of checking user's input through browser to
      adjust input before send to server. faster.
      The algorithm is simple:
      ◦Target your element in JavaScript
      ◦Capture the form submission event
      ◦Prevent the default form submission from continuing
      ◦Check if all inputs are correct 
            (correct range, required, etc)
            ◦If yes, allow the form to submit
      ◦If there’s a bad input, then show an error message 
          describing to the user how to correct it.
      */
      event.preventDefault();

      try {
        // hide containers by default
        errorContainer.classList.add("hidden");
        resultContainer.classList.add("hidden");

        /*
        document.title => get/set its title, originally to head element
        document.cookies => cokkies being shared between your
        browser and the entire server at the current domain
        */
        // Values come from inputs as strings, no matter what :(
        const firstNumberValue = firstNumberElement.value;
        const secondNumberValue = secondNumberElement.value;
        const operationValue = operationElement.value;

        const parsedFirstNumberValue = parseInt(firstNumberValue);
        const parsedSecondNumberValue = parseInt(secondNumberValue);
        //here it turns "+" to function add and returned the stored functions
        const operation = operationStringToFunction(operationValue);

        const result = operation(
          parsedFirstNumberValue,
          parsedSecondNumberValue
        );

        resultTextElement.textContent = "The result is " + result;
        resultContainer.classList.remove("hidden");
        /*
        Things to note:
        ◦If you were submitting to the server, if the input was successful 
            you would simply allow the form to complete (ie: never prevent 
            the form default event from occurring).
        ◦You can and should store references to events when possible
        */
      } catch (e) {
        //= ? : ---------- if-then-else
        const message = typeof e === "string" ? e : e.message;
        errorTextElement.textContent = e;
        errorContainer.classList.remove("hidden");
        /*
        If the form should not be submitted, you will prevent 
        the default event and show the user some form of error message. 
        You can also do other helpful things such as:
        ◦Highlight the inputs that need to be corrected
        ◦Focus the user’s cursor into a bad input
        ◦Offer a suggested correction
        */
      }
    });//end of callbacks
  }//end of if (staticForm)
})();
/*
We can create new element just like receiving and setting them
document.createElement("input"); >> not yet there to be rendered!!!
We can set input type or give it an initial value
Manipulate DOM: add elements to parent by:
parent.appendChild(newNode) or
parentNode.insertBefore(newNode, oldNode) or
parent.removeChild(childNode)method.
Directly set the inner HTML would rebuild entire node which is expensive
*/
