
  <div id="top"></div>

  <header>
    <a class="homelink" href="/">mage.coach</a>
  </header>
  <div id="page">
    <div id="content">
      <h1 id="box-title">{{statusText}}</h1>
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
      </div>
    </div>
  </div>

