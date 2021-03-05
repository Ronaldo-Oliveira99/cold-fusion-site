<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Untitled Document</title>
<style type="text/css">
.imageWrapper {
	padding: 10px;
	width: 200px;
	background-color: #CCC;
	border: 2px solid #000;
}
.imageWrapper p {
	font-size: .8em;
	font-style: italic;
}
</style>
</head>

<body>
<h1>Hello dear visitor, today is <cfoutput>#dateFormat(now())#</cfoutput></h1>
<p>Here is a first image with a legend</p>
<!---First Picture--->
<div class="imageWrapper">
  <img src="bandPlaying.jpg" width="200" height="133" alt="Band Playing" />
  <p>The HD Street band in concert!</p>
</div>
<!---End first Picture--->
<p>And here is a second image with anoter legend</p>
<!---Second Picture--->
<div class="imageWrapper">
  <img src="tonyAndMatt.jpg" width="200" height="133" alt="Tony And Matt" />
  <p>Tony congratulates Matt after Matt's stunning saxophone solo!</p>
</div>
<!---End second Picture--->
</body>
</html>
