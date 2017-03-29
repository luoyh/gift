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
	<script>
		$(function() {
			var msg = function(msg) {
				 layer.open({
				    content: msg
				    ,skin: 'msg'
				    ,time: 2 //2秒后自动关闭
				  });
			};
			$('#id1').click(function() {
				if ($('#modal1').data('reg') == 1) {
					alert('您已经申请了');
					return;
				}
				$('#modal1').modal('show');
			});
			$('#id2').click(function() {
				//alert(222);
			});

			$('#id3').click(function() {
				$('#account').val('');
				$('#account').data('type', 1);
				$('#modal2').modal('show');
				/*
				if ($('#modal1').data('reg') == 1) {
					$('#modal2').modal('show');
				} else {
					$('#modal1').modal('show');
				}*/
			});

			$('#id4').click(function() {
				$('#account').val('');
				$('#account').data('type', 2);
				$('#modal2').modal('show');
			});

			$('#id5').click(function() {
				$('#account').val('');
				$('#account').data('type', 3);
				$('#modal2').modal('show');
			});
			$('#modal_submit').click(function() {
				var 
					realname = $.trim($('#realname').val()),
					mobile = $.trim($('#mobile').val()),
					wxqq = $.trim($('#wxqq').val());

				if ('' == realname) {
					alert('名字不能为空');
					return;
				}
				if ('' == mobile) {
					alert('电话不能为空');
					return;
				}
				if ('' == wxqq) {
					alert('微信/QQ不能为空');
					return;
				}
				$.post(root + '/register', {
					realname: realname,
					mobile: mobile,
					wxqq: wxqq
				}, function(r) {
					if (200 != r.code) {
						alert(r.msg);
					} else {
						alert('申请已提交,请等待审核.');
						$('#modal1').modal('hide');
						$('#modal1').data('reg', 1);
					}
				});
			});

			$('#m2_submit').click(function() {
				var account = $.trim($('#account').val());
				if ('' == account) {
					alert('帐号不能为空');
					return;
				}

				var type = $('#account').data('type');
				var inf = ['微信红包', '茅台酒', '华为手机'][type-1];

				$.post(root + '/fetch', {
					acc: account,
					type: type,
					used: 0
				}, function(r) {
					if (200 == r.code) {
						layer.open({
						    content: '<h1 style="color:#f62b43;">领取成功</h1><h2 style="color:#f62b43;">恭喜您获得'+inf+'</h2><p>请联系客服尽快领取</p>'
						    ,btn: 'OK'
						  });
						$('#modal2').modal('hide');
					} else {
						layer.open({
						    content: '<h1 style="color:#f62b43;">领取失败</h1><p>您输入的帐号不正确</p><p>或您还没达到领取资格</p>'
						    ,btn: 'OK'
						});
					}
				});

			});
		});
	</script>

</head>
<body>
	<div class="top col-xs-12 box" style="font-size:12px;line-height:30px;">
		<div class="col-xs-6" style="    margin-left: -40px;">
			服务热线: 0755-33558928
		</div>
		<div class="col-xs-6">
			欢迎访问松赢投资！为投资者提供优质、专业的黄金投资咨询服务。
		</div>
	</div>
	<div class="top-info col-xs-12 box">
		<div class="col-xs-6" style="line-height: 90px;">
			<a href="http://www.sge9999.com/"><img src="${base}/images/logo.png"></a>
		</div>
		<div class="col-xs-6">
			<div style="width:240px;margin:auto;">
				<div style="float:left;">
					<span onclick="javascript:window.open('http://b.qq.com/webc.htm?new=0&sid=800085598&o=松赢黄金&q=7', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');"  style="margin-top:50px;display:inline-block;font-size:17px;cursor:pointer;">在线客服|QQ客服</span>
				</div>
				<img src="${base}/images/img_01.png">
			</div>
		</div>
	</div>
	<div class="box top-bg col-xs-12" style="text-align:center;">
		<img src="${base}/images/bgbanner.png" style="width:100%;">
		<div class="box top-join">
			<img id="id1" src="${base}/images/img_07.png">
			<img id="id2" src="${base}/images/img_08.png" onclick="javascript:window.open('http://b.qq.com/webc.htm?new=0&sid=800085598&o=松赢黄金&q=7', '_blank', 'height=502, width=644,toolbar=no,scrollbars=no,menubar=no,status=no');">
		</div>
	</div>
	<div class="col-xs-12 box">
		<div class="take">
			<img class="take-bg" src="${base}/images/no1.png">
			<img class="take-btn" id="id3" src="${base}/images/take.png">
		</div>
		<div class="take">
			<img class="take-bg" src="${base}/images/no2.png">
			<img class="take-btn" id="id4" src="${base}/images/take.png">
		</div>
		<div class="take">
			<img class="take-bg" src="${base}/images/no3.png">
			<img class="take-btn" id="id5" src="${base}/images/take.png">
			<!-- <div class="col-xs-12" style="margin-top:50px;height:140px;padding:0;outline: 1px solid #f62b43;background:#fef8ec;">
				<img class="col-xs-3" src="${base}/images/img_09.png" style="height:150px;margin-top:-10px;float:left;padding:0;">
				<div class="col-xs-9" style="height:140px;background:#fef8ec;">
					<div class="col-xs-offset-2" style="float:left;">
						<img src="${base}/images/img_012.png" style="width:120px;margin-top:20px;">
						<button class="btn" style="width:120px;display:block;margin-top:20px;background:#fe5102;color:#fff;">立即领取</button>
					</div>
					<img class="col-xs-offset-2" src="${base}/images/img_016.png" style="width:90px;margin-top:10px;">
				</div>
			</div>
			<div class="col-xs-12" style="margin-top:50px;height:140px;padding:0;outline: 1px solid #f62b43;background:#fef8ec;">
				<img class="col-xs-3" src="${base}/images/img_010.png" style="height:150px;margin-top:-10px;float:left;padding:0;">
				<div class="col-xs-9" style="height:140px;background:#fef8ec;">
					<div class="col-xs-offset-2" style="float:left;">
						<img src="${base}/images/img_013.png" style="width:120px;margin-top:20px;">
						<button class="btn" style="width:120px;display:block;margin-top:20px;background:#fe5102;color:#fff;">立即领取</button>
					</div>
					<img class="col-xs-offset-2" src="${base}/images/img_017.png" style="width:90px;margin-top:10px;">
				</div>
			</div>
			<div class="col-xs-12" style="margin-top:50px;height:140px;padding:0;outline: 1px solid #f62b43;background:#fef8ec;">
				<img class="col-xs-3" src="${base}/images/img_011.png" style="height:150px;margin-top:-10px;float:left;padding:0;">
				<div class="col-xs-9" style="height:140px;">
					<div class="col-xs-offset-2" style="float:left;">
						<img src="${base}/images/img_014.png" style="width:120px;margin-top:20px;">
						<button class="btn" style="width:120px;display:block;margin-top:20px;background:#fe5102;color:#fff;">立即领取</button>
					</div>
					<img class="col-xs-offset-2" src="${base}/images/img_018.png" style="width:90px;margin-top:10px;">
				</div>
			</div> -->
		</div>
		<div class="take">
			<img src="${base}/images/img_019.png" style="width:100%;">
		</div>
	</div>
	<div class="box col-xs-12">
		<img class="lc" src="${base}/images/img_022.png" style="display:block;margin:auto;margin-top:30px;">
	</div>
	<div class="box col-xs-12" style="background:#f62b43;">
		<div class="take">
			<img class="zxbg" src="${base}/images/bgstep.png">
			<img class="zysx" data-toggle="modal" data-target="#modal3" src="${base}/images/img_020.png">
			<img class="lxwm" data-toggle="modal" data-target="#modal4" src="${base}/images/img_021.png">

		</div>
	</div>

<div id="modal1" class="modal fade" tabindex="-1" role="dialog">
<div class="vertical-alignment-helper">
  <div class="modal-dialog vertical-align-center" role="document">
    <div class="modal-content" style="border: 3px solid #fa4e01;">
      <div class="modal-body">
        <div class="form-horizontal" style="margin-top: 20px;">
		  <div class="form-group">
		    <label class="col-xs-3 control-label" style="text-align: right;">姓名:</label>
		    <div class="col-xs-7">
		      <input type="text" class="form-control" id="realname" placeholder="姓名">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-xs-3 control-label" style="text-align: right;">电话:</label>
		    <div class="col-xs-7">
		      <input type="text" class="form-control" id="mobile" placeholder="电话">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-xs-3 control-label" style="text-align: right;">微信/QQ:</label>
		    <div class="col-xs-7">
		      <input type="text" class="form-control" id="wxqq" placeholder="微信/QQ">
		    </div>
		  </div>
		</div>
      </div>
      <div class="modal-footer" style="text-align: center;">
        <button id="modal_submit" type="button" class="btn" style="background: #f62b43;font-weight: bold;border-color: #f62b43;color:#fff;">提交</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>
</div><!-- /.modal -->

<div id="modal2" class="modal fade" tabindex="-1" role="dialog">
<div class="vertical-alignment-helper">
  <div class="modal-dialog vertical-align-center" role="document">
    <div class="modal-content" style="border: 3px solid #fa4e01;">
      <!--<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:#f62b43;font-weight: bold;">礼包领取</h4>
      </div>-->
      <div class="modal-body">
        <div class="form-horizontal" style="margin-top: 20px;">
		  <div class="form-group">
		    <label class="col-xs-3 control-label" style="text-align: right;">帐号:</label>
		    <div class="col-xs-7">
		      <input type="text" class="form-control" id="account" placeholder="帐号">
		    </div>
		  </div>
		</div>
      </div>
      <div class="modal-footer" style="text-align: center;">
        <button id="m2_submit" type="button" class="btn" style="background: #f62b43;font-weight: bold;border-color: #f62b43;color:#fff;">提交</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>
</div><!-- /.modal -->

<div id="modal3" class="modal fade" tabindex="-1" role="dialog">
<div class="vertical-alignment-helper">
  <div class="modal-dialog vertical-align-center" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:#f62b43;font-weight: bold;">注意事项</h4>
      </div>
      <div class="modal-body">
        <p><span class="tipss">1</span>每个新客户均可参与本次活动；</p>
        <p><span class="tipss">2</span>奖品领取规则：</p>
		<p><span class="level">第一档：</span>新开户，交易满10手Au(T+D)</p>
		<p><span class="level">第二档：</span>交易满100手Au(T+D)</p>
		<p><span class="level">第三档：</span>交易满500手Au(T+D)</p>
		<p><span class="level">注：其他品种不计入本次活动；</span></p>
		<p><span class="tipss">3</span>交易量从报名之日起，一个月内；</p>
		<p><span class="tipss">4</span>新客户红包每人限领一次；</p>
		<p><span class="tipss">5</span>奖品发放时间为次月10-20日；</p>
		<p><span class="tipss">6</span>完成活动客户联系客服提供正确联系信息；</p>
		<p><span class="tipss">7</span>此次活动最终解释权归松赢黄金所有。如有疑问请详询客服。</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">我知道了</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>
</div><!-- /.modal -->

<div id="modal4" class="modal fade" tabindex="-1" role="dialog">
 <div class="vertical-alignment-helper">
  <div class="modal-dialog vertical-align-center" role="document">
    <div class="modal-content">
      <div class="modal-body" style="text-align:center;">
      	<h1 style="color: #f62b43;">联系我们</h1>
      	<p><span style="color: #f62b43;">松赢官网：</span><a href="http://www.sge9999.com">www.sge9999.com</a></p>
		<p><span style="color: #f62b43;">客服电话：</span>17007702205（微信）</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">我知道了</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div>
</body>
</html>
