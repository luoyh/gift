<#assign base = request.contextPath />
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="luoyh">
	<title>pay</title>
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
		<div class="col xs-12">
			<div class="col-xs-6">
				<h1>2.2	订单支付</h1>
				<form class="login form-horizontal" method="post" action="https://trade.mobaopay.com/cgi-bin/netpayment/pay_gate.cgi" target="_blank">
				  <div class="form-group">
				    <label class="col-sm-2 control-label">apiName</label>
				    <div class="col-sm-10">
				      <select class="form-control" name="apiName">
				      	<option value="WEB_PAY_B2C">WEB方式，PC浏览器</option>
				      	<option value="WAP_PAY_B2C">WAP方式，手机支付</option>
				      </select>
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">apiVersion</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="apiVersion" value="1.0.0.0" placeholder="apiVersion">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">platformID</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="platformID" value="platformID" placeholder="platformID">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">merchNo</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="merchNo" value="merchNo" placeholder="merchNo">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">orderNo</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="orderNo" value="orderNo" placeholder="orderNo">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">tradeDate</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="tradeDate" value="tradeDate" placeholder="tradeDate">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">amt</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="amt" value="19.33" placeholder="amt">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">merchUrl</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="merchUrl" value="https://www.baidu.com" placeholder="merchUrl">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">merchParam</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="merchParam" value="merchParam" placeholder="merchParam">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">tradeSummary</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="tradeSummary" value="tradeSummary" placeholder="tradeSummary">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">signMsg</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="signMsg" value="signMsg" placeholder="signMsg">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">bankCode</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="bankCode" value="bankCode" placeholder="bankCode">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">choosePayType</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="choosePayType" value="choosePayType" placeholder="choosePayType">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-4 col-sm-4">
				      <button type="submit" class="btn btn-default">Submit</button>
				    </div>
				  </div>
				</form>
			</div>
			<div class="col-xs-6">
				<h1>2.3	订单支付(防钓鱼)</h1>
				<form class="login form-horizontal" method="post" action="https://trade.mobaopay.com/cgi-bin/netpayment/pay_gate.cgi" target="_blank">
				  <div class="form-group">
				    <label class="col-sm-2 control-label">apiName</label>
				    <div class="col-sm-10">
				      <select class="form-control" name="apiName">
				      	<option value="WEB_PAY_B2C">WEB方式，PC浏览器</option>
				      	<option value="WAP_PAY_B2C">WAP方式，手机支付</option>
				      </select>
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">apiVersion</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="apiVersion" value="1.0.0.1" placeholder="apiVersion">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">platformID</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="platformID" value="platformID" placeholder="platformID">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">merchNo</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="merchNo" value="merchNo" placeholder="merchNo">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">orderNo</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="orderNo" value="orderNo" placeholder="orderNo">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">tradeDate</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="tradeDate" value="tradeDate" placeholder="tradeDate">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">amt</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="amt" value="19.33" placeholder="amt">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">merchUrl</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="merchUrl" value="https://www.baidu.com" placeholder="merchUrl">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">merchParam</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="merchParam" value="merchParam" placeholder="merchParam">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">tradeSummary</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="tradeSummary" value="tradeSummary" placeholder="tradeSummary">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">signMsg</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="signMsg" value="signMsg" placeholder="signMsg">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">bankCode</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="bankCode" value="bankCode" placeholder="bankCode">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">choosePayType</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="choosePayType" value="choosePayType" placeholder="choosePayType">
				    </div>
				  </div>
				  <div class="form-group">
				    <label class="col-sm-2 control-label">customerIP</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="customerIP" value="${ip }" placeholder="customerIP">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-4 col-sm-4">
				      <button type="submit" class="btn btn-default">Submit</button>
				    </div>
				  </div>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>
