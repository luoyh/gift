<#assign base = request.contextPath />
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="luoyh">
	<title>500现金</title>
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
Date.prototype.format = function(fmt)   
{ //author: meizz
  var o = {   
    "M+" : this.getMonth()+1,                 //月份
    "d+" : this.getDate(),                    //日
    "h+" : this.getHours(),                   //小时
    "m+" : this.getMinutes(),                 //分
    "s+" : this.getSeconds(),                 //秒
    "q+" : Math.floor((this.getMonth()+3)/3), //季度
    "S"  : this.getMilliseconds()             //毫秒
  };   
  if(/(y+)/.test(fmt))   
    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
  for(var k in o)   
    if(new RegExp("("+ k +")").test(fmt))   
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
  return fmt;   
} ;
		var search = function(page, size) {
			$.get(root + '/admin/five/page', {
				page: page,
				size: size
			}, function(r) {
				var htm = '';
				$.each(r.content || [], function(i, e) {
					htm += '<tr>\
								<td>'+e.realname+'</td>\
								<td>'+e.mobile+'</td>\
								<td>'+new Date(e.gmtCreated).format('yyyy-MM-dd hh:mm:ss')+'</td>\
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
    		<a href="${base}/admin/dashboard" class="btn btn-default">开户管理</a>
    		<a href="${base}/admin/account" class="btn btn-default">帐号管理</a>
    	</div>

    	<input type="hidden" id="total" value="${page.totalElements}">
    	<input type="hidden" id="size" value="${page.size}">
    	<table class="table table-hover table-bordered">
	    	<thead>
	    		<tr>
	    			<th>姓名</th>
	    			<th>电话</th>
					<th>申请时间</th>
	    		</tr>
	    	</thead>
	    	<tbody>
				<#list page.content as e>
				    <tr>
				        <td>${e.realname}</td>
				        <td>${e.mobile}</td>
						<td>${e.gmtCreated}</td>
				    </tr>
				</#list>
	    	</tbody>
		</table>
		<ul class="pagination"></ul>
    </div>
</body>
</html>
