/* b9d6ef - lightblue */
/* 266b97 - darkblue  */
/* General */

* {
    -moz-box-sizing: border-box;
    box-sizing: border-box;
    line-height: 1.5em;
}

html{
    height:100%;
}

div, p, a, li, td, span {
    -webkit-text-size-adjust: none;
    font-family: Verdana, sans-serif;
    -webkit-box-sizing: border-box;
}


h1 {
    font-weight: bold;
    font-size: 30px;
    margin:0;
}

h2 {
    font-weight: bold;
    font-size: 20px;
}

body {
    margin: 0;
    padding: 0;
    height: 100%;
    font-size: 14px;
    padding-bottom: 72px;
}

a {
  color: #428bca;
  text-decoration: none;
}

form a {
  color: #fff;
  text-decoration: underline;
}

#container {
    min-height: 100%;
    position: relative;
    background: #fff;
}

/* Header */

.homelink {
    text-indent: -9999px;
    display: block;
}

/* Footer */

footer {
    background-color: #b9d6ef;
}

#footer-wrapper {
    float: left;
}

.footerlist {
    color: #00517c;
    overflow: hidden;
    margin: 0;
}

.footerlist li {
    float: left;
    list-style-type: none;
    padding: 5px 10px;
}

footer .homelink {
    background: transparent url('https://static.mage.coach/img/logos/logoFooter.svg') 0 center / contain no-repeat;
}

.footerlist li a {
    color: #00517c;
    padding: 0;
    text-decoration: none;
    display: block;
}

#footerlinks {
    float: left;
}

#footershare {
    float: right;
}

#footershare li {
    margin: 10px 0;
}

#footershare li a{
    display:block;
}

#footershare .youtube a{
    background:transparent url('https://static.mage.coach/img/socialmedia/youtube-round.svg') center center /contain no-repeat;
}
#footershare .instagram a{
    background:transparent url('https://static.mage.coach/img/socialmedia/instagram-round.svg') center center /contain no-repeat;
}
#footershare .facebook a{
    background:transparent url('https://static.mage.coach/img/socialmedia/facebook-round.svg') center center /contain no-repeat;
}
#footershare .twitter a{
    background:transparent url('https://static.mage.coach/img/socialmedia/twitter-round.svg') center center /contain no-repeat;
}
#footershare .coach a{
    background:transparent url('https://static.mage.coach/img/socialmedia/coach-round.svg') center center /contain no-repeat;
}

.photo {
  border-radius: 10px;
  margin-right: 20px;
  margin-bottom: 10px;
}
.pull-left {
  float: left!important;
}

/*Startpage specials*/

body#start {
    border-top-width: 0px;
}

#start header {
    background-color: transparent;
    margin-top: 0;
}

#start #page:before {
    display: none;
}

#start header:before {
    display: none;
}

#start #content {
    background: transparent url('https://static.mage.coach/img/logos/logoBig.svg') 0 0 / 100% no-repeat;
}

#container {
    background: #266b97 url('https://static.mage.coach/img/iceberg.svg') no-repeat top center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
}

/* Analyze form */

#analyze-form {
    color: #000000;
    width: 100%;
    overflow:hidden;
    padding-bottom: 5px;
}

#analyze-form label {
    width: 100%;
    display: block;
}

#analyze-form select, textarea, #analyze-url, #email{
    color: #000;
    padding: 0.5em;
    margin-bottom: 1em;
    display: block;
    width: 100%;
    font-size: 16px;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    -webkit-border-radius: 7px;
    -moz-border-radius: 7px;
    border-radius: 7px;
    border: 1px solid #dfdfdf;
    background: #fff;
}

#analyze-url {
    width: 100%;
}

#analyze-form select{
    background:#fff url('https://static.mage.coach/img/arrow_down.svg') right center /14px auto no-repeat;
}

input[type="submit"], button{
    font-size: 18px;
    border: 0 none;
    padding: 0.25em 1em;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    cursor:pointer;
}

#analyze-form input[type="submit"] {
    background-color: #ffd100;
    float: right;
}

/* Processing */

#randomimg{
    overflow:hidden;
    margin:0 auto;
    position:relative;
}

#randomtexts{
padding-top: 10px;
padding-bottom: 10px;
}

#randomimg .gif-bg{
    background:url('') no-repeat center center;
    width:100%;
    height:100%;
    min-height:100%;
    position: absolute;
    top: -9999px;
    bottom: -9999px;
    left: -9999px;
    right: -9999px;
    margin: auto;
    background-size:cover;
}

/* Results */


.result-button{
    color:#fff;
    margin:20px 0;
}

#result-see-details {
    background-color:#da251d;
}

#result-download {
    background-color:#0093dd;
}

#stars{
    margin:10px 0 20px;
    letter-spacing:1vw;
}

#bad-result #stars{
    color:#da251d;
}

#good-result #stars{
    color:#e88829;
}

#great-result #stars{
    color:#468847;
}

#hero #stars{
    color:#468847;
}

#share{
    overflow:hidden;
    padding:0;
}

#share:before{
    width:130px;
    height:100px;
    display:block;
    content:"";
    background:transparent url('https://static.mage.coach/img/coach/penguin_share_this.svg') left center /contain no-repeat;
}

#share li{
    float:left;
    padding:30px 1vw;
    width:15%;
    list-style-type:none;
}

#share li a{
    display:block;
    height:40px;
    text-indent:-9999px;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
}

#share .facebook a{
    background:#3b5998 url('https://static.mage.coach/img/socialmedia/facebook.svg') center center /contain no-repeat;
}
#share .twitter a{
    background:#00aced url('https://static.mage.coach/img/socialmedia/twitter.svg') center center /contain no-repeat;
}
#share .googleplus a{
    background:#dd4b39 url('https://static.mage.coach/img/socialmedia/googleplus.svg') center center /contain no-repeat;
}
#share .linkedin a{
    background:#007bb6 url('https://static.mage.coach/img/socialmedia/linkedin.svg') center center /contain no-repeat;
}
#share .pinterest a{
    background:#cb2027 url('https://static.mage.coach/img/socialmedia/pinterest.svg') center center /contain no-repeat;
}

#ship{
    margin: -35px;
}

/* Desktop only */

@media only screen and (min-width: 769px) {

    body {
      border-top: 48px solid #266b97;
      background-color: #b9d6ef;
    }

    #page, header, footer {
        width: 100%;
        max-width: 1280px;
        margin: 0 auto;
    }

    #page {
        margin-top: 50px;
        padding-left: 10px;
        min-height: 300px;
        overflow:hidden;
    }

    body:not(#start) #page:before {
        content: "";
        max-width: 255px;
        max-height: 255px;
        width: 20vw;
        height: 20vw;
        float: left;
    }

    #content {
        margin: 3% 20px 20px 21%;
        min-height: 250px;
        -webkit-border-radius: 10px;
        -moz-border-radius: 10px;
        border-radius: 10px;
        background-color: #b9d6ef;
        padding: 20px;
        font-size: 20px;
        line-height: 1.5;
    }

    #start #content {
        width: 50%;
        min-width: 550px;
        margin: 0 auto;
        padding-top: 160px;

    }

    #report #page:before {
        background: transparent url('https://static.mage.coach/img/coach/penguin_report.svg') 0 0 / contain no-repeat;
    }

    #sponsors #page:before {
        background: transparent url('https://static.mage.coach/img/coach/penguin_sponsors.svg') 0 0 / contain no-repeat;
    }

    #about #page:before {
        background: transparent url('https://static.mage.coach/img/coach/penguin_about.svg') 0 0 / contain no-repeat;
    }

    #faq #page:before {
        background: transparent url('https://static.mage.coach/img/coach/penguin_faq.svg') 0 0 / contain no-repeat;
    }

    #process #page:before {
        background: transparent url('https://static.mage.coach/img/coach/penguin_inspecting.svg') 0 0 / contain no-repeat;
    }

    #bad-result #page:before {
        background: transparent url('https://static.mage.coach/img/coach/penguin_bad_result.svg') 0 0 / contain no-repeat;
    }

    #good-result #page:before {
        background: transparent url('https://static.mage.coach/img/coach/penguin_good_result.svg') 0 0 / contain no-repeat;
    }

    #great-result #page:before {
        background: transparent url('https://static.mage.coach/img/coach/penguin_great_result.svg') 0 0 / contain no-repeat;
    }

    #hero #page:before {
        background: transparent url('https://static.mage.coach/img/coach/captainCoach.svg') 0 0 / contain no-repeat;
    }

    #top {
        width: 100%;
        border-top: 10px solid #266b97;
        background-color: #fff;
        margin-right: 50%;
    }

   #about p {
      font-size: 20px;
      line-height: 1.5;
    }

    #report p {
      font-size: 20px;
      line-height: 1.5;
    }

    #sponsors p {
      font-size: 20px;
      line-height: 1.5;
    }

    header {
        background-color: #266b97;
        border-top: 36px solid #266b97;
        margin-top: -100px;
        height: 80px;
        max-width: 100%;
    }

    header .homelink {
        background: transparent url('https://static.mage.coach/img/logos/logoBig.svg') 0 0 / 85% auto no-repeat;
        width: 295px;
        height: 62px;
        margin-top: 7px;
        margin-right: 10px;
        position: relative;
        z-index: 2;
    }

 header .homelink:after {
        #background: transparent url('https://static.mage.coach/img/tabshape.svg') 0 0 / cover no-repeat;
        #content: "";
        #width: 76px;
        #height: 29px;
        #margin-top: 34px;
        #float: right;
        #z-index: 1;
    }

    #analyze-form label {
        width: 100%;
        padding-right: 15%;
        display: block;
        overflow: hidden;
    }

    #analyze-form span {
        float: left;
        padding-top: 0.5em;
        font-size: 18px;
    }

    #analyze-form input[type="submit"] {
        margin-right: 15%;
        font-size: 24px;
    }

    #analyze-form input[type="text"] {
      font-size: 24px;
    }

    #analyze-form input[type="url"] {
      font-size: 24px;
    }

    #analyze-form select, textarea, #email {
        width: 60%;
        float: right;
    }

    /* Processing */

    #randomimg {
        width: 71vw;
        height: 32vw;
        max-width: 100%;
        max-height: 490px;
    }

    /* Result */

    #result-see-details {
        margin-right:10px;
    }

    #stars{
        font-size:50px;
    }

    #share:before{
        float:left;
    }

    /* Footer */

    footer {
        height: 72px;
        bottom: -72px;
        padding-left: 10px;
        position: absolute;
        left: 0;
        right: 0;
    }

    footer .homelink {
        max-width: 215px;
        width: 20%;
        height: 100%;
        float: left;
    }

    #footerlinks{
        padding: 24px 10px 0 10px;
    }

    #footershare li a{
        width:40px;
        height:40px;
    }
}

/*Devices with max width 768px */

@media only screen and (max-width: 768px) {

    body {
        font-size: 16px;
        background-color: #b9d6ef;
    }

    #page, header, .footerlist {
        max-width: 100%;
    }

    #page{
        overflow:hidden;
    }

    #start #page{
        border:10px solid #0095d2;
    }

    #content {
        margin-left: 0;
        margin: 10px 0 0;
        padding: 13px;
    }

    #container{
        background-color:#266b97;
        padding-bottom:20px;
    }

    #start #container {
        #background-size: contain;
    }

    #start #content {
        width: 100%;
        padding-top: 20vw;
        border:1vw solid transparent;
    }

    body:not(#start) #page {
        -webkit-border-radius: 10px 10px 0 0;
        -moz-border-radius:  10px 10px 0 0;
        border-radius:  10px 10px 0 0;
        background-color: #fff;
        margin: 3vw 3vw 0;
        width: auto;
    }

    #top {
        display: none;
    }

    header .homelink {
        background: #266b97 url('https://static.mage.coach/img/logos/logoBig.svg') center / 70% auto no-repeat;
        height: 80px;
        border: 10px solid #266b97;
    }

    h1 {
        font-size: 26px;
    }

    #about h1#box-title:after {
        background: transparent url('https://static.mage.coach/img/coach/penguin_about.svg') center 0 / contain no-repeat;
    }

    #report h1#box-title:after {
        background: transparent url('https://static.mage.coach/img/coach/penguin_report.svg') center 0 / contain no-repeat;
    }

    #sponsors h1#box-title:after {
        background: transparent url('https://static.mage.coach/img/coach/penguin_sponsors.svg') center 0 / contain no-repeat;
    }

    #faq h1#box-title:after {
        background: transparent url('https://static.mage.coach/img/coach/penguin_faq.svg') center 0 / contain no-repeat;
    }

    #bad-result h1#box-title:after {
        background: transparent url('https://static.mage.coach/img/coach/penguin_bad_result.svg') center 0 / contain no-repeat;
    }

    #good-result h1#box-title:after {
        background: transparent url('https://static.mage.coach/img/coach/penguin_good_result.svg') center 0 / contain no-repeat;
    }

    #great-result h1#box-title:after {
        background: transparent url('https://static.mage.coach/img/coach/penguin_great_result.svg') center 0 / contain no-repeat;
    }

    #hero h1#box-title:after {
        background: transparent url('https://static.mage.coach/img/coach/captainCoach.svg') center 0 / contain no-repeat;
    }

    /* Analyze */

    #analyze-form {
        margin: 1em 0 3em 0;
    }

    #analyze-form input[type="submit"] {
        width: 100%;
        padding: 0.5em 1em;
    }

    /* Processing */

    #randomimg {
        width: 87vw;
        height: 39vw;
        margin-bottom:2vw;
    }

    /* Result */

    .resultpage #analyze-url{
        border-color:#bfe6f2;
        margin-bottom:3em;
    }

    #stars{
        font-size:9vw;
    }

    .result-button{
        width:45%;
        padding:1em;
    }

    #result-download {
        float:right;
    }

    #share:before{
        margin:0 auto;
    }

    #share li{
        width:20%;
    }

    #share li a{
        height:50px;
    }

    /* Footer */
    footer {
        font-size: 16px;
        overflow:hidden;
        margin-bottom:20px;
        text-align:center;
    }

    body:not(#start) footer{
        margin: 0 3vw 3vw;
        -webkit-border-radius: 0 0 10px 10px;
        -moz-border-radius: 0 0 10px 10px;
        border-radius: 0 0 10px 10px;
    }

    footer .homelink {
        bottom: 0;
        left: 0;
        margin: 0 auto 4px;
        position: absolute;
        right: 0;
        width: 24%;
    }

    #footershare {
        width:100%;
        float:none;
        padding:0;
    }

    #footershare li{
        display:inline;
        float:none;
    }

    #footershare li a{
        display:inline-block;
        margin:1em 0;
        width:60px;
        height:60px;

    }

    #footerlinks {
        width: 100%;
        height: auto;
        padding:0;
    }

    #footerlinks li {
        width: 100%;
        float:none;
        text-align: center;
        padding:1em;
        border-bottom:1px solid #bfe6f2;
    }

}
