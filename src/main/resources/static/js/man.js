// var 
// 	canvas = document.getElementById('c'),
// 	ctx = canvas.getContext("2d");

$(function() {
	layer.open({type: 2, shadeClose: false});
	//var main = $('#main');
	var img = new Image();
	img.src = root + 'images/man.jpg';
	$(img).css({
		position: 'absolute',
		left: 0,
		top: 0,
		'max-width': '100%'
	});
	var msg = function(msg) {
		 layer.open({
		    content: msg
		    ,skin: 'msg'
		    ,time: 2 //2秒后自动关闭
		  });
	};
	img.onload = function() {
		var rw = 1922, rh = 3319;
		$(img).attr('usemap', 'imgmap');
		$('body').append($(img));
		var w = $(img).width(), h = $(img).height();
		var 
			a1 = '<area shape="rect" coords="'+566 * (w / rw)+','+751*(h/rh)+','+883*(w/rw)+','+843*(h/rh)+'" id="id1">',
			a2 = '<area shape="rect" coords="'+1043 * (w / rw)+','+751*(h/rh)+','+1358*(w/rw)+','+843*(h/rh)+'" id="id2">',
			a3 = '<area shape="rect" coords="'+908 * (w / rw)+','+1063*(h/rh)+','+1141*(w/rw)+','+1126*(h/rh)+'" id="id3">',
			a4 = '<area shape="rect" coords="'+908 * (w / rw)+','+1320*(h/rh)+','+1141*(w/rw)+','+1383*(h/rh)+'" id="id4">',
			a5 = '<area shape="rect" coords="'+566 * (w / rw)+','+1578*(h/rh)+','+1141*(w/rw)+','+1641*(h/rh)+'" id="id5">'
		;
		var map = '<map id="imgmap" name="imgmap">'+a1+a2+a3+a4+a5+'</map>';
		$('body').append(map);

		$('#id1').click(function() {
			if ($('#modal1').data('reg') == 1) {
				alert('你已经开户了');
				return;
			}
			$('#modal1').modal('show');
			// layer.open({
			//     content: '<div class="form-horizontal">\
			// 				  <div class="form-group">\
			// 				    <label class="col-sm-2 control-label">姓名:</label>\
			// 				    <div class="col-sm-10">\
			// 				      <input type="text" class="form-control" id="realname" placeholder="姓名">\
			// 				    </div>\
			// 				  </div>\
			// 				  <div class="form-group">\
			// 				    <label class="col-sm-2 control-label">电话:</label>\
			// 				    <div class="col-sm-10">\
			// 				      <input type="text" class="form-control" id="mobile" placeholder="电话">\
			// 				    </div>\
			// 				  </div>\
			// 				  <div class="form-group">\
			// 				    <label class="col-sm-2 control-label">微信/QQ:</label>\
			// 				    <div class="col-sm-10">\
			// 				      <input type="text" class="form-control" id="mobile" placeholder="微信/QQ">\
			// 				    </div>\
			// 				  </div>\
			// 				</div>'
			//     ,btn: '提交'
			//   });
		});

		$('#id2').click(function() {
			//alert(222);
		});

		$('#id3').click(function() {
			$('#account').val('');
			$('#account').data('type', 1);
			if ($('#modal1').data('reg') == 1) {
				$('#modal2').modal('show');
			} else {
				$('#modal1').modal('show');
			}
		});

		$('#id4').click(function() {
			$('#account').val('');
			$('#account').data('type', 2);
			if ($('#modal1').data('reg') == 1) {
				$('#modal2').modal('show');
			} else {
				$('#modal1').modal('show');
			}
		});

		$('#id5').click(function() {
			$('#account').val('');
			$('#account').data('type', 3);
			if ($('#modal1').data('reg') == 1) {
				$('#modal2').modal('show');
			} else {
				$('#modal1').modal('show');
			}
		});
		layer.closeAll();
	};

	$('#modal_submit').click(function() {
		var 
			realname = $.trim($('#realname').val()),
			mobile = $.trim($('#mobile').val()),
			wxqq = $.trim($('#wxqq').val());

		if ('' == realname) {
			msg('名字不能为空');
			return;
		}
		if ('' == mobile) {
			msg('电话不能为空');
			return;
		}
		if ('' == wxqq) {
			msg('微信/QQ不能为空');
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
				alert('开户成功');
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

		$.post(root + '/fetch', {
			acc: account,
			type: $('#account').data('type'),
			used: 0
		}, function(r) {
			if (200 == r.code) {
				alert('领取成功');
				$('#modal2').modal('hide');
			} else {
				alert(r.msg);
			}
		});

	});
});

// <img id="main" usemap="imgmap" src="${base}/images/man.jpg" style="position:absolute;left:0;top:0;max-width:100%;">
// 	<map name="imgmap" id="imgmap">
// 		<area shape="rect" coords="566,751,883,843" id="id1">
// 		<area shape="rect" coords="1043,751,1358,843" id="id2">
// 		<area shape="rect" coords="908,1320,1141,1383" id="id3">
// 		<area shape="rect" coords="909,1580,1141,1642" id="id4">
// 	</map>