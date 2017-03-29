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
	<link rel="stylesheet" href="${base}/lib/page/page.css">
	
	<script src="${base}/lib/js/jquery.min.js"></script>
	<script src="${base}/lib/js/bootstrap.min.js"></script>
	<script src="${base}/lib/layer/layer.js"></script>
	<script src="${base}/lib/page/page.js"></script>
	<script>root='${base}';</script>	

	<style>
		body {
			background: #ccc;
		}
		.container {
			
		}
		.table {
			background: #fff;
			width: 600px;
			margin: 20px auto;
		}
	</style>
	<script>

		var search = function(page, size) {
			$.get(root + '/admin/member/page', {
				page: page,
				size: size
			}, function(r) {
				var htm = '';
				$.each(r.content || [], function(i, e) {
					htm += '<tr>\
								<td>'+e.realname+'</td>\
								<td>'+e.mobile+'</td>\
								<td>'+e.wxqq+'</td>\
							</tr>';
				});
				$('tbody').html(htm);
			});
		};
		$(function() {
			$('.pagination').page({
				pageSize: $('#size').val(),
				total: $('#total').val(),
				pageNo: 1,
				onPageClicked: function(obj, index) {
					search(index - 1, $('#size').val())
				}
			});
		});
	</script>

</head>
<body>
    <div class="container">
    	<div style="width: 600px; margin: 50px auto;">
    		<a href="${base}/admin/account" class="btn btn-default">帐号管理</a>
    	</div>

    	<input type="hidden" id="total" value="${page.totalElements}">
    	<input type="hidden" id="size" value="${page.size}">
    	<table class="table table-hover table-bordered">
	    	<thead>
	    		<tr>
	    			<th>姓名</th>
	    			<th>电话</th>
	    			<th>微信/QQ</th>
	    		</tr>
	    	</thead>
	    	<tbody>
				<#list page.content as e>
				    <tr>
				        <td>${e.realname}</td>
				        <td>${e.mobile}</td>
				        <td>${e.wxqq}</td>
				    </tr>
				</#list>
	    	</tbody>
		</table>
		<ul class="pagination"></ul>
    </div>
</body>
</html>
