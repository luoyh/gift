<#assign base = request.contextPath />
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="luoyh">
	<title>新手礼包</title>
	<link href="${base}/lib/css/bootstrap.min.css" rel="stylesheet">
	<link href="${base}/css/man.css" rel="stylesheet">
	
	<script src="${base}/lib/js/jquery.min.js"></script>
	<script src="${base}/lib/js/bootstrap.min.js"></script>
	<script src="${base}/lib/layer/layer.js"></script>
	<script>root='${base}';</script>	
</head>
<body>
	<h1>${timestamp}</h1>
	<p>
		${html}
		</p>
	
</body>
</html>
