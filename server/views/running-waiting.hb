<!-- waiting step 1 -->
  <div id="top"></div>

  <header>
    <a class="homelink" href="/">mage.coach</a>
  </header>
  <div id="page">
    <div id="content">
      <h1 id="box-title">Waiting in line</h1>
      <div id="randomimg">
	<script>
  	$(function() {
    		var xhr = $.get("https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=funny+penguin");
    		xhr.done(function(data) {
      		  $('.gif-bg').css('background-image', 'url(' + data.data.image_url + ')');
    		  });
  		});
  	</script>
	<div class="gif-bg"></div>
      </div>
      <div id="randomtext">
        <p>{{#if queueNumber}}<span id="queue">Your place in the queue is number  {{queueNumber}}!</span>{{/if}}
        We will test your URL and measure the performance.</p><p>The test will take a minute or two, just hang tight, we will talk about performance and give you the joy of internet with help from the <a href="https://giphy.com//" target="_blank">Giphy</a>. <em>All links will open in a new window!</em>
      </p>
      </div>
    </div>
  </div>
