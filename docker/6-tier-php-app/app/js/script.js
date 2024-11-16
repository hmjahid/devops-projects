// Wait until the page is fully loaded
window.onload = function() {
    // Display an alert when the page loads
    alert("Welcome to the application!");

    // Example: Change the text color of the h1 element
    var h1 = document.querySelector('h1');
    h1.style.color = "blue";

    // Log a message in the browser's console
    console.log("Page Loaded!");
  };