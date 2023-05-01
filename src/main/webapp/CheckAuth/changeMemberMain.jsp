<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>change membership</title>
<style>
   
   /* 입력 폼을 감싸는 div 스타일 */
   .form-container {
      margin: 50px auto;
      width: 50%;
      padding: 20px;
      border: 1px solid #ccc;
      border-radius: 10px;
   }
   /* 바텀 요소 스타일 */
   .bottom {
      background-color: #5BB551;
      color: white;
      text-align: center;
      top: 80%;
       padding: 10px;
   }
   .class{
   float: right;
   }
   /* input 스타일 */
   input[type="text"], input[type="password"] {
      padding: 10px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
      
   }
   /* 인증 확인 버튼 스타일 */
   input[type="submit"] {
      background-color: #5BB551;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      float: right;
   }
   /* 인증 확인 버튼 스타일 */
   input[type="submit"]:hover {
      background-color: #2c81ba;
      margin: 5px 0;
    }
    input[type="button"] {
       background-color: #5BB551;
       border-radius: 4px;
       border: 1px solid green;
        width: 40px;
      height: 40px;
      font-size: 20px;
      text-align: center;
    }
    input[type="radio"] {
        display: ;
    }
    input[type="radio"] + span {
        display: inline-block;
        padding: 15px 10px;
        border: 1px solid #dfdfdf;
        background-color: #ffffff;
        text-align: center;
        cursor: pointer;
    }
    input[type="radio"] {
       vertical-align: middle;
       appearance: none;
       border: max(2px, 0.1em) solid gray;
      border-radius: 50%;
      width: 1.25em;
      height: 1.25em;
   }
    input[type="radio"]:checked {
       border: 0.4em solid tomato;
   }
   input[type="radio"]:focus-visible {
      outline-offset: max(2px, 0.1em);
      outline: max(2px, 0.1em) dotted tomato;
   }
   input[type="radio"]:hover {
      box-shadow: 0 0 0 max(4px, 0.2em) lightgray;
      cursor: pointer;
   }
   input[type="radio"]:disabled {
      background-color: lightgray;
      box-shadow: none;
      opacity: 0.7;
      cursor: not-allowed;
   }
   
   input[type="radio"]:disabled + span {
      opacity: 0.7;
      cursor: not-allowed;
   }
  #level {
  text-align: center;
}

label {
  display: inline-block;
  margin: 10px;
  vertical-align: middle;
}

input[type="radio"] {
  margin-right: 5px;
  vertical-align: middle;
}
</style>
	<link rel="stylesheet" href="../css/MainPage.css" type="text/css">
<script>
	function confirmDelete() {
	  return confirm("정말 탈퇴하시겠습니까?")
	}
</script>
</head>
<body>
<header id="headerType" class="header__wrap nexon fix">
	<div class="header__inner">
        <div class="header__logo">
            <a href="../Title/TitleMain.jsp">Match <em>Get It!</em></a>
        </div>
        <nav class="header__menu" style="width: 55%">
            <ul>
                <li><a href="../Board/List.jsp">Board</a></li>
                <li><a href="#">Nocitice</a></li>
                <li><a href="#">Challenger</a></li>
            </ul>
        </nav>
		<div class="header__member">
	    		<span>${dto.memberName}님</span>
	    		<a href="../Logout/LogoutController.do">로그아웃</a>
		</div>
	</div>
</header>

    <div>
       <h1>회원 정보 수정</h1>
    </div>
    <div class="form-container" align="center">
       <form action="../servlet/UpdateController.do" method="post">
           <label scope="row">이메일:</label>
        	<input type="text" id="email_id" name="email" class="form_w200" value="${dto.email}" title="이메일 아이디" placeholder="이메일" maxlength="18" readonly/>
			&emsp;<br>
        	<label for="name">이름:</label>
        	<input type="text" id="name" name="memberName" value="${dto.memberName}" ><br>
           <label for="password">비밀번호:</label>
           <input type="password" id="password" name="password" placeholder="비밀번호" value="${dto.password}"><br>
           <label for="phoneNumber">전화번호:</label>
         <input type="text" id="phoneNumber" name="phoneNumber" value="${dto.phoneNumber}" placeholder="숫자만 입력해주세요."><br>
         <label for="nickname">닉네임:</label>
           <input type="text" id="nickname" name="nickname" value="${dto.nickName}"><br>         
         <div align="center" id="level">
            <p>숙련도</p>
            <h5>본인의 실력을 선택해주세요.</h5> <br>
            <label>
                  <input type="radio" name="level" value="상" ${dto.level == '상' ? 'checked' : ''}/>
                  <span>상</span>
              </label>
              <label>
                  <input type="radio" name="level" value="중" ${dto.level == '중' ? 'checked' : ''}/>
                  <span>중</span>
              </label>
              <label>
                  <input type="radio" name="level" value="하" ${dto.level == '하' ? 'checked' : ''}/>
                  <span>하</span>
              </label>
            </div>
            <input type="submit" value="변경사항 저장"/>
                 
        </form>
        <form action="../servlet/DeleteInfoController.do" method="post" onsubmit="return confirmDelete();">
       <input type="hidden" name="email" value="${dto.email}" />
       <input type="submit" value="회원 탈퇴" />
   		</form>
    </div>   

</body>
</html>