<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/style.css">
    <script>
       function emailAuthentiCation(){
    	   
      		var email = $("[name='email']").val();   	
    	      console.log(email);
    	    
    	      $.ajax({
    			  url : "/member/emailAuthen",
    	    	  type : "post",
    	    	  data : {"email":email},
    	          success : function(data){
    	        	  alert("이메일로 인증번호를 전송하였습니다.");
    	          },
    	        error : function(){
    	        	console.log("error");
    	        	alert("이메일 확인 부탁드립니다");
    	        }
    	      })
       }         
          
        function authentiCation(){
        	 var authenNum = $("[name='number']").val();
        	 
        	 $.ajax({
        		 url : "/member/authen",
        		 type : "post",
        		 data : {"authenNum":authenNum},
        		 success : function(data){
        			 if(data==1){
   			          $("#emailMessageNum").show();
			          $("#emailMessageNum").css("color","blue").text("인증이 확인되었습니다.!!")
        			 }else{
        				 $("#number").val("");
        				 alert("인증번호를 입력해주세요.");
        			 }
        		 },
        		 error : function(){
        			 console.log("실패");
        		 }
        		 
        		 
        	 })
        }
               
        
    </script>
</head>
<body>
    <div class="main-join-wrap">
        <form class="join-form" action="/member/member_modify" method="POST">
            <div class="join-title-main">
                <h2 class="join-title">회원정보 수정</h2>
            </div>
            <div class="join-insert-wrap">
                <table class="join-table">

                    <caption class="blind">회원가입 정보입력</caption>
                    <colgroup>
                        <col style="width:20%">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row">
                                아이디
                            </th>
                            <td>
                                ${login.id}
                            </td>
                        </tr>
                        <input type="hidden" title="id" id="id" name="id" value=${login.id}>
                        <input type="hidden" title="name" id="name" name="name" value=${login.name}>
                        <tr>
                            <th scope="row"><label for="password">비밀번호</label></th>
                            <td>
                                <input type="password" title="비밀번호" id="password" name="password">
                                <span class="error-message" id="pwMessage" role="alert" style="display:none"></span>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="password-check">*비밀번호 확인</label></th>
                            <td>
                                <input type="password" title="비밀번호 확인" id="password-check" name="user_check_pw">
                                <span class="error-message" id="pwCheckMessage" role="alert" style="display:none"></span>
                            </td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td>
                                ${login.name}
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="phone">휴대폰</label></th>
                            <td>
                                <input type="phone" title="휴대폰" id="phone" name="phone" required=""
                                    value=${login.phone}>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="email">이메일</label></th>
                            <td>
                                <input type="email" id="email" name="email" value=${login.email}>
                                <input type="button" value="인증" onclick="emailAuthentiCation()">
                                <span class="error-message" id="emailMessage" role="alert" style="display:none"></span>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="number">인증번호</label></th>
                            <td>
                                <input type="text" id="number" name="number" placeholder="수정시 인증이필요합니다">
                                <input type="button" value="인증번호" onclick="authentiCation()">
                                <span class="error-message" id="emailMessageNum" role="alert" style="display:none"></span>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
            <div class="join-button-wrap">
                <input type="submit" value="수정" class="join-button join-submit">
        </form>
        <form action="/member/withdrawal_result" method="POST">
            <input type="hidden" title="id" id="id" name="id" value=${login.id}>
            <input type="submit" value="탈퇴" class="join-button member-delete-btn">
        </form>
        
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="/resources/js/member_modify.js"></script>
</body>

</html>