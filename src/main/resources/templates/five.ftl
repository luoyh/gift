<#assign base = request.contextPath />
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="luoyh">
	<title>黄金开户送500现金</title>
	<link href="${base}/lib/css/bootstrap.min.css" rel="stylesheet">
	<link href="${base}/css/five.css" rel="stylesheet">
	
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

			$('#submit').click(function() {
				if ($(this).data('reg') == 1) {
					return;
				}
				var 
					realname = $('#username').val(),
					mobile = $('#mobile').val();
				if (realname == '' || mobile == '') {
					msg('姓名或电话不能为空');
					return;
				}
				$.post(root + '/five/reg', {
					realname: realname,
					mobile: mobile
				}, function(r) {
					if (200 != r.code) {
						alert(r.msg);
					} else {
						//alert('申请已提交,请等待审核.');
						$('#modal6').modal('show');
						$('.reg').attr('readonly', 'readonly');
						$('.reg').attr('disabled', 'disabled');
						$('.reg').css('background', '#ccc');
						$('.reg').data('reg', 1);
					}
				});
			});


			$('.flow0').click(function() {

			});
		});
	</script>

</head>
<body>
	<div class="man">
		<img src="${base}/fivehundred/bg.png" class="bg">

		<img src="${base}/fivehundred/banner.png" class="banner">

		<div class="info">
			<img src="${base}/fivehundred/img-01.png">
			<input class="reg" type="text" id="username" placeholder="请输入您的姓名">
			<input class="reg" type="text" id="mobile" placeholder="请输入您的手机">
			<img class="reg" src="${base}/fivehundred/img-03.png" id="submit">
		</div>

		<img src="${base}/fivehundred/img-04.png" class="introduction">

		<img src="${base}/fivehundred/img-05.png" class="qrcode">

		<div class="flow">
			<img src="${base}/fivehundred/img-08.png" data-toggle="modal" data-target="#modal5" class="flow2">
			<img src="${base}/fivehundred/img-06.png" data-toggle="modal" data-target="#modal3" class="flow0">			
			<img src="${base}/fivehundred/img-07.png" data-toggle="modal" data-target="#modal4" class="flow1">
		</div>
	

		<div class="tips">
			风险警告：所有黄金交易都会对您的资本带来风险。您有可能亏损。因此，这些产品可能不适合所有人。您应当确保您已理解其中所涉及的风险，若有需要，请咨询个别专家建议。风险提示：投资有风险，入市需谨慎。
		</div>
	</div>

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
		<p><span class="level">豪礼一：</span>新开户，交易满10手Au(T+D)</p>
		<p><span class="level">送：500元现金红包：</span>（客服微信转账）</p>
		<p><span class="level">豪礼二：</span>交易满100手Au(T+D)</p>
		<p><span class="level">送：茅台酒X3</span>（价值3988元）</p>
		<p><span class="level">豪礼三：</span>交易满500手Au(T+D)</p>
		<p><span class="level">送：华为保时捷手机</span>（价值12000元）</p>
		<p><span class="level">注：其他品种不计入本次活动，豪礼领取不叠加</span></p>
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
 </div>
</div><!-- /.modal -->


<div id="modal5" class="modal fade" tabindex="-1" role="dialog">
<div class="vertical-alignment-helper">
  <div class="modal-dialog vertical-align-center" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:#f62b43;font-weight: bold;">参与流程</h4>
      </div>
      <div class="modal-body">
        <p><span class="level">第一步：</span>提交姓名和电话，选择立即提交，并关注客服微信登记</p>
        <p><span class="level">第二步：</span>客服人员电话或微信协助了解黄金投资各事项</p>
		<p><span class="level">第三步：</span>开始交易，达成目标</p>
		<p><span class="level">第四步：</span>联系客服，领取奖品</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">我知道了</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>
</div><!-- /.modal -->



<div id="modal6" class="modal fade" tabindex="-1" role="dialog">
<div class="vertical-alignment-helper">
  <div class="modal-dialog vertical-align-center" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" style="color:#f62b43;font-weight: bold;">操作成功</h4>
      </div>
      <div class="modal-body">
        <p><img style="max-width:100%;display:block;margin:auto;" src="${base}/fivehundred/image001.jpg"></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">我知道了</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div>
</div><!-- /.modal -->

<script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan style=display:none; id='cnzz_stat_icon_1261575475'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s95.cnzz.com/z_stat.php%3Fid%3D1261575475' type='text/javascript'%3E%3C/script%3E"));</script>
</body>
</html>
