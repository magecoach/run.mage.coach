<!DOCTYPE html>
<html>
  <head>
    <meta charset='utf-8'>
    <meta name="viewport" content="initial-scale=1">
    <base href="https://static.mage.coach/">
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <title>Mage.coach results for {{url}}</title>
    <meta name="description" content="Web performance test performed {{date}} with {{browser}} using a {{connection}} connection from {{location}}.">
    <meta name="keywords" content="mage.coach, magento, wpo, webperf, perfmatters, performance">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="img/ico/mage.coach-144.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/ico/mage.coach-114.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/ico/mage.coach-72.png">
    <link rel="apple-touch-icon-precomposed" href="img/ico/mage.coach-57.png">
    <link rel="shortcut icon" href="img/ico/mage.coach.ico">
  </head>
  <body id="{{bodyId}}" class="resultpage">
  <script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

    ga('create', 'UA-89167735-1', 'auto');
    ga('send', 'pageview');
    </script>
    <div id="container">
      <div id="top"></div>

      <header>
        <a class="homelink" href="https://run.mage.coach">mage.coach</a>
      </header>
      <div id="page">
        <div id="content">
          <h1 id="box-title">{{boxTitle}}</h1>
          <div id="stars">{{{stars}}}</div>

            <input id="analyze-url" type="text" disabled
                   value="{{url}}"/>

          <p class="result-test-info">
            Test performed {{date}} with {{browser}} using a {{connection}} connection from {{location}}.
          </p>
          <p class="result-test-info">{{boxDesciption}}
          </p>

          <p class="result-user-agent">
            <em>RUMSpeedIndex:</em> <strong>{{speedIndex}}</strong>
            <em>Score:</em> <strong>{{ruleScore}}</strong>
          </p>

          <div id="share-result">
            <a href="{{link}}"><button id="result-see-details" class="result-button">See details</button></a>
            <a href="{{id}}.tar.gz"><button id="result-download" class="result-button">Download</button></a>
            <ul id="share">
              <li class="twitter"><a href="https://twitter.com/intent/tweet?text={{myUrl}}" title="Share on Twitter"><span class="count">Tw</span></a></li>
              <li class="facebook"><a href="https://www.facebook.com/sharer/sharer.php?u={{myUrl}}" title="Share on Facebook"><span class="count">Fb</span></a></li>
              <li class="googleplus"><a href="https://plus.google.com/share?url={{myUrl}}" title="Share on Google Plus"><span class="count">G+</span></a></li>
              <li class="pinterest"><a href="https://pinterest.com/pin/create/button/?url=&media={{myUrl}}&description=">Pinterest</a></li>
              <li class="linkedin"><a href="https://www.linkedin.com/shareArticle?mini=true&url={{myUrl}}&title=&summary=&source=">LinkedIn</a></li>
            </ul>
          </div>
        </div>
      </div>
      <footer>

        <a class="homelink" href="https://run.mage.coach">mage.coach</a>

        <ul id="footerlinks" class="footerlist">
          <li><a href="https://run.mage.coach/">Home</a></li>
          <li><a href="https://run.mage.coach/about/">About</a></li>
          <li><a href="https://run.mage.coach/sponsors/">Sponsors</a></li>
          <li><a href="https://run.mage.coach/report/">Report</a></li>
          <li><a href="https://run.mage.coach/faq/">FAQ</a></li>
        </ul>

        <ul id="footershare" class="socialcount footerlist">
          <li class="facebook"><a href="https://www.facebook.com/magecoach" title="Like on Facebook"></a></li>
          <li class="twitter"><a href="https://twitter.com/magecoach" title="Follow on Twitter"></a></li>
          <li class="coach"><a href="https://mage.coach/" title="Mage Coach"></a></li>
	</ul>

      </footer>
    </div>
  </body>
</html>
