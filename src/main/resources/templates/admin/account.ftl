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
} 
		var search = function(page, size) {
			$.get(root + '/admin/account/page', {
				account: '',
				page: page,
				size: size
			}, function(r) {
				var htm = '';
				$.each(r.content || [], function(i, e) {
					htm += '<tr>\
								<td>'+e.acc+'</td>\
								<td>'+(e.type != 1 ? e.type == 2 ? '茅台' : '手机' : '500红包')+'</td>\
								<td>'+(e.used == 0 ? '<span class="label label-success">未使用</span>' : '<span class="label label-warning">已使用</span>')+'</td>\
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

			$('#submit').click(function() {
				var acc = $.trim($('#account').val());
				if ('' == acc) {
					alert('帐号不能为空');
					return;
				}
				$.post(root + '/admin/account', {
					acc: acc,
					type: $.trim($('#acc_type').val()),
					used: 0
				}, function(r) {
					if (r.code == 200) {
						window.location.reload();
					} else {
						alert('增加失败,帐号已存在');
					}
				});
			});

		});
	</script>

</head>
<body>
    <div class="container">
    	<div style="width: 600px; margin: 50px auto;">
    		<a href="${base}/admin/dashboard" class="btn btn-default">开户管理</a>
    		<a href="${base}/admin/five" class="btn btn-default">500现金</a>
		    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
		    	增加帐号
			</button>
    	</div>

    	<input type="hidden" id="total" value="${page.totalElements}">
    	<input type="hidden" id="size" value="${page.size}">
    	<table class="table table-hover table-bordered">
	    	<thead>
	    		<tr>
	    			<th>帐号</th>
	    			<th>礼包类型</th>
	    			<th>是否使用</th>
				<th>录入时间</th>
	    		</tr>
	    	</thead>
	    	<tbody>
				<#list page.content as e>
				    <tr>
				        <td>${e.acc}</td>
						<td>
							<#if e.type == 1>
								 500红包
							<#elseif e.type == 2>
								茅台 
							<#elseif e.type == 3>
								手机 
							<#else> 
							</#if> 
						</td>
				        <td>${(e.used == 0) ? then('<span class="label label-success">未使用</span>', '<span class="label label-warning">已使用</span>')}</td>
						<td>${e.gmtCreated}</td>
				    </tr>
				</#list>
	    	</tbody>
		</table>
		<ul class="pagination"></ul>
    </div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">增加帐号</h4>
      </div>
      <div class="modal-body">
        <div class="form-horizontal">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">帐号:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="account" placeholder="帐号">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">礼包类型</label>
		    <div class="col-sm-10">
		    	<select id="acc_type" class="form-control">
		    		<option value="1">500红包</option>
		    		<option value="2">茅台</option>
		    		<option value="3">手机</option>
		    	</select>
		    </div>
		  </div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button id="submit" type="button" class="btn btn-primary">保存</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>
