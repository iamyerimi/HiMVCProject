<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function modify() {
	document.getElementById("questionTitle").readOnly = false;
	document.getElementById("questionContent").readOnly = false;
	document.getElementById("modibtn").disabled = false;
	document.getElementById("modi").disabled = true;
}

function modifyquest() {
	var title = document.getElementById("questionTitle").value;
	var content = document.getElementById("questionContent").value;
	var questNum = ${qboard.questionNum};
	
	var form = document.createElement("form");
    form.setAttribute("charset", "UTF-8");
    form.setAttribute("method", "Post");  //Post 방식
    form.setAttribute("action", "${pageContext.request.contextPath }/quest/modiquest"); //요청 보낼 주소

    var hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "questionTitle");
    hiddenField.setAttribute("value", title);
    form.appendChild(hiddenField);

    hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "questionContent");
    hiddenField.setAttribute("value", content);
    form.appendChild(hiddenField);
    
    hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "questionNum");
    hiddenField.setAttribute("value", questNum);
    form.appendChild(hiddenField);
    document.body.appendChild(form);
    
    form.submit();	
}

function remove() {
	var questNum = ${qboard.questionNum};
	var form = document.createElement("form");
	form.setAttribute("method", "post");  //Post 방식
    form.setAttribute("action", "${pageContext.request.contextPath }/quest/removequest"); //요청 보낼 주소
    
	hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "questionNum");
    hiddenField.setAttribute("value", questNum);
    form.appendChild(hiddenField);
    document.body.appendChild(form);
    
    form.submit();
}
</script>
</head>
<body>
<div>
<p>문의 제목 : <input type="text" name="questionTitle" id="questionTitle" value="${qboard.questionTitle }" readonly/></p>
<div>
문의 내용 : <textarea name="questionContent" cols="30" rows="30" id="questionContent" readonly>${qboard.questionContent }</textarea>
</div>
<p>문의 날짜 : ${qboard.questionDate }</p>
<p>문의자  : ${info.name }</p>
</div>
<button type="button" onclick="modify();" id="modi"> 수정하기</button>
<button type="button" onclick="modifyquest();" disabled="disabled" id="modibtn"> 전송하기</button>
<button type="button" onclick="remove();">삭제하기</button>

</body>
</html>