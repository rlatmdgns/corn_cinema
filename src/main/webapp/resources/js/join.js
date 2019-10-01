$(function () {
    $('.join-form').on('submit', function (event) {
     var idReg = /^[a-zA-Z0-9]{6,10}$/;
     var pwReg = /^[a-zA-Z0-9]{6,10}$/;
     var nameReg = /^[가-힣]+$/;
     var phoneReg = /^\d{2,3}-\d{3,4}-\d{4}$/
     var emailReg = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/
     //    event.preventDefault();
     //아아디
     if($("#id").val()==""){
         alert("아이디를 입력해주세요.");
         $("#id").focus();
         return false;
     }
     //아이디 테스트
     if(!idReg.test($("#id").val())){
         alert("아이디는 숫자 문자 포함 6~10자로 입력해주세요.");
         $("#id").focus();
         return false;
     }
     //비밀번호
     if(!pwReg.test($("#password").val())){
         alert("비밀번호는 숫자 문자 포함 6~10자로 입력해주세요.");
         $("#password").focus();
         return false;
     }
     //비밀번호 확인
     if ($("#password-check").val()!==$("#password-check").val()) {
         alert("비밀번호와 비밀번호 확인이 다릅니다.");
         $("#user_check_pw").val("");
         $("#user_check_pw").focus();
         return false;
     }
     // 아이디랑 비밀번호랑 같은지
     if ($("#id").val()==($("#password").val())) {
         alert("비밀번호가 ID와 똑같습니다.");
         $("#password").val("");
         $("#password").focus();
         return false;
     }
     //이름
     if(!nameReg.test($("#name").val())){
         alert("이름 형식이 맞지 않습니다..");
         $("#name").focus();
         return false;
     }
     //휴대폰
     if(!phoneReg.test($("#phone").val())){
         alert("휴대폰 형식이 틀립니다.ex(010-1234-1234)");
         $("#phone").focus();
         return false;
     }
     if(!emailReg.test($("#email").val())){
         alert("이메일 형식이 틀립니다.");
         $("#email").focus();
         return false;
     }
     this.submit();
    });
 });