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
	<style>
		body {
			background: #ccc;
		}

		.login {
		    width: 500px;
		    margin: 100px auto;
		    background: #e0e0e0;
		    padding: 30px;
		}
	</style>
	<script>
		$(function() {
			$('.login').keydown(function(evt) {
				if (evt.keyCode == 13) {
					$('#submit').click();
				}
			});
			$('#submit').click(function() {
				$.post(root + '/login', {
					username: $.trim($('#input_username').val()),
					password: $.trim($('#input_password').val())
				}, function(r) {
					if (r.code == 200) {
						window.location.href = root + '/admin/dashboard';
					} else {
						alert('Username or Password invalid!');
					}
				});
			});
		});
	</script>

</head>
<body>
	<div class="container">
		<div class="login form-horizontal">
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">Username</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="input_username" placeholder="username">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
		    <div class="col-sm-10">
		      <input type="password" class="form-control" id="input_password" placeholder="Password">
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-4 col-sm-4">
		      <button type="button" id="submit" class="btn btn-default">Sign in</button>
		    </div>
		  </div>
		</div>
	</div>
	
</body>
</html>
