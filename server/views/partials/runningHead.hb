
  <meta charset='utf-8'>
  <meta name="viewport" content="initial-scale=1">
  <title>Analyze your Magento performance against the best practice rules.</title>
  <meta http-equiv="refresh" content="30" />
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/img/ico/mage.coach-144.png">
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/img/ico/mage.coach-114.png">
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/img/ico/mage.coach-72.png">
  <link rel="apple-touch-icon-precomposed" href="/img/ico/mage.coach-57.png">
  <link rel="shortcut icon" href="/img/ico/mage.coach.ico">
  <meta name="description" content="How fast is your Magento site? How good does it follow web performance best practice rules? Find out by using Mage.coach.">
  <meta name="keywords" content="mage.coach, magento, webperf, perfmatters, performance">
  <script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
  <script type = "text/javascript">

  var oldState = 'unknown';

  function worker() {

  var xhr = new XMLHttpRequest();
  xhr.open("GET", "/api/status/{{id}}", true);

  xhr.onload = function() {
    var serverResponse = JSON.parse(xhr.responseText);
     if (serverResponse.status === oldState) {
       oldState = serverResponse.status;
       setTimeout(worker, 5000);
     }
     else if (oldState !== 'unknown') {

       if (oldState === 'waiting') {
        document.getElementById('randomtext').innerHTML = '<p>Your test has started. It will finish in a couple of minutes. Leave your browser window open and just relax.</p>';
       }

       var display = 'Testing your page';
       if (serverResponse.status === 'waiting') {
         display = 'Waiting in line';
       } else if (serverResponse.status === 'uploading') {
         display = 'Uploading the result';
       } else if (serverResponse.status === 'crawling') {
         display = 'Fetching the URL';
       } else if (serverResponse.status === 'analyzing') {
         display = 'Analyzing performance rules';
       } else if (serverResponse.status === 'measuring') {
         display = 'Collecting timing metrics';
       }
       document.getElementById('box-title').innerHTML = display;
       if (serverResponse.status === 'done' || serverResponse.status === 'failed') {
         location.reload();
         return;
       } else {
         oldState = serverResponse.status;
         setTimeout(worker, 2000);
       }
     } else {
     oldState = serverResponse.status;
     setTimeout(worker, 2000);
   }
  };

  xhr.onerror = function() {
    // oops couldn't fetch the response
  };

  xhr.send();
}

worker();

var showCats = true;

  function getContent(date) {

    if (!showCats) {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "/texts/webperf.json", true);

    xhr.onload = function() {
    var serverResponse = JSON.parse(xhr.responseText);

    var mess = serverResponse.messages[Math.floor(Math.random() * serverResponse.messages.length)];

     document.getElementById("randomtext").innerHTML = '<p>' + mess.m + '</p>';
   };

    xhr.onerror = function() {
      // oops couldn't fetch the response
    };

    xhr.send();
    showCats = true;
  }
  else {
    //document.getElementById("result").src =
    document.getElementsByClassName("gif-bg").src =
    "//thecatapi.com/api/images/get?format=src&type=gif&date=" + date;
    showCats = false;
  }

  }

  setInterval(function(){getContent(new Date())}, 15000);
  </script>
  <style>
  {{> css}}
  </style>
