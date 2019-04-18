"use strict";
let li = "";

(function () {

  function test(str) {
    if (!str) throw "No text provided";
    if (typeof str !== "string") throw "Must provide a string";

    str = str.replace(/([^a-z0-9])+/gmi, '').toLowerCase();
    let strRev = str.split('').reverse().join('');

    if (str === strRev) {
      return true;
    }
    return false;
  }

  const staticForm = document.getElementById("static-form");

  if (staticForm) {
    const textString = document.getElementById("textA");

    const errorContainer = document.getElementById("error-container");
    const errorTextElement = errorContainer.getElementsByClassName(
      "text-goes-here")[0];

    const resultContainer = document.getElementById("result-container");
    const resultTextElement = resultContainer.getElementsByClassName(
      "text-goes-here")[0];

    staticForm.addEventListener("submit", event => {
      event.preventDefault();

      try {
        errorContainer.classList.add("hidden");
        resultContainer.classList.add("hidden");

        const text = textString.value;
        const result = test(text);

        if (result) {
          li += "<li class=\"is-palindrome\">This is a palindrome: " + text + " </li>";
        } else {
          li += "<li class=\"not-palindrome\">This is NOT a palindrome: " + text + " </li>";
        }

        resultTextElement.innerHTML = li;
        errorTextElement.textContent = '';
        resultContainer.classList.remove("hidden");
      } catch (e) {
        const message = typeof e === "string" ? e : e.message;
        errorTextElement.textContent = message;
        errorContainer.classList.remove("hidden");
      }
    });
  }
})();
