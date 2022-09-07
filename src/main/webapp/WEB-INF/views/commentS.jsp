<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>JobCom</title>
</head>
<body>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
var bseq = '${detail.bseq}';

$('[name=commentInsertBtn]').click(function() {
	var insertData = $('[name=commentInsertForm]').serialize();
	commentInsert(insertData);
});

function commentList() {
	$.ajax({
		url : '/comment/list',
		type : 'get',
		data : {'bseq':bseq},
		success : function(data){
			var a ='';
			$.each(data, function(key, value) {
				a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
				a += '<div class="commentInfo'+value.cno+'">'+'작성자 : '+value.writer;
				a += '<c:if test="${sessionScope.member.nick_name != null}"><a onclick="commentUpdate('+value.cno+',\''+value.content+'\');" style="cursor:pointer"> 수정 </a></c:if>';
				a += '<c:if test="${sessionScope.member.nick_name != null}"><a onclick="commentDelete('+value.cno+');" style="cursor:pointer"> 삭제 </a> </div></c:if>';
				a += '<div class="commentContent'+value.cno+'"> <p> 내용 : '+value.content +'</p>';
				a += '</div></div></div>';
			});
			
			$(".commentList").html(a);
		}
	});
}

function commentInsert(insertData) {
	$.ajax({
		url : '/comment/insert',
		type : 'post',
		data : insertData,
		success : function(data) {
			if(data == 1) {
				commentList();
				$('[name=content]').val('');
			}
		}
	});
}

function commentUpdate(cno, content) {
	var a ='';
	
	a += '<div class="input-group">';
	a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
	a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
	a += '</div>';
	
	$('.commentContent'+cno).html(a);
}

function commentUpdateProc(cno) {
	var updateContent = $('[name=content_'+cno+']').val();
	
	$.ajax({
		url : '/comment/update',
		type : 'post',
		data : {'content' : updateContent, 'cno' : cno},
		success : function(data) {
			if(data == 1) commentList(bseq);
		}
	});
}

function commentDelete(cno) {
	$.ajax({
		url : '/comment/delete/'+cno,
		type : 'post',
		success : function(data){
			if(data == 1) commentList(bseq);
		}
	});
}

$(document).ready(function() {
	commentList();
});

</script>
</body>
</html>