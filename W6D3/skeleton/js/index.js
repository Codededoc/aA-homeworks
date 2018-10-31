console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
  type: 'GET',
  url: 'http://api.openweathermap.org/data/2.5/weather' +
  	'?q=London,uk&appid=657c90ef1d4eebec0401403593febc9b',
  success(data) {
    console.log(data);
  },
  error() {
    console.error("An error occurred.");
  },
});

// Add another console log here, outside your AJAX request
console.log("Testing Ajax")
