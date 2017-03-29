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
	<script src="${base}/js/man.js"></script>
	<script>
		root = '${base}';
	</script>
</head>
<body>
	<!--
	<img id="main" usemap="imgmap" src="${base}/images/man.jpg" style="position:absolute;left:0;top:0;max-width:100%;">
	<map name="imgmap" id="imgmap">
		<area shape="rect" coords="566,751,883,843" id="id1">
		<area shape="rect" coords="1043,751,1358,843" id="id2">
		<area shape="rect" coords="908,1320,1141,1383" id="id3">
		<area shape="rect" coords="909,1580,1141,1642" id="id4">
	</map>
-->

<div id="modal1" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">信息</h4>
      </div>
      <div class="modal-body">
        <div class="form-horizontal">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">姓名:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="realname" placeholder="姓名">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">电话:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="mobile" placeholder="电话">
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-sm-2 control-label">微信/QQ:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="wxqq" placeholder="微信/QQ">
		    </div>
		  </div>
		</div>
      </div>
      <div class="modal-footer">
        <button id="modal_submit" type="button" class="btn btn-primary">提交</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div id="modal2" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">礼包领取</h4>
      </div>
      <div class="modal-body">
        <div class="form-horizontal">
		  <div class="form-group">
		    <label class="col-sm-2 control-label">帐号:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="account" placeholder="帐号">
		    </div>
		  </div>
		</div>
      </div>
      <div class="modal-footer">
        <button id="m2_submit" type="button" class="btn btn-primary">提交</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</body>
</html>