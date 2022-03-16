/**
 * 
 */
/**
 * 
 */
var check = false;
var form = document.joinForm;
   // 이용 약관
   const $all = $("#term");
   const $inputs = $(".terms");

   $all.on('click', function(){
       if($(this).is(":checked")){
           $inputs.prop('checked', true);
       }else{
           $inputs.prop('checked', false);
       }
   });

   $inputs.on('click', function(){
       var check = true;
       if(!$(this).is(":checked")){
           $all.prop('checked', false);
       }

       if($inputs.filter(":checked").length == 2){
           $all.prop('checked', true);
       }
   });
   
   
   // 아이디 중복검사
   
   function checkId(userId){
      if(!userId){
         $("#result").text("아이디를 입력해주세요.");
         $("#result").css("color", "#ffb61a");
         
         return;
      }
      
      $.ajax({
         url: contextPath + "/user/UserCheckIdOk.user?userId=" + userId,
         type: "get",
         dataType: "json",
         success: function(result){
            if(result.status == "ok"){
               $("#result").text("사용한 가능한 아이디입니다.");
               $("#result").css("color", "#03c75a");
               check = true;
            }else{
               $("#result").text("중복된 아이디입니다.");
               $("#result").css("color", "red");
               $("input#userId").focus();
            }
         },
         error: function(){
            console.log("중복검사 오류");
         }
      });
   }

   // 키 이벤트
   //$("input#memberId").keyup(function(){
//      checkId($(this).val());
   //});
   $("input#userId").on('blur' ,function(){
         
         check = false;
         checkId($(this).val());
      });


   //비밀번호 유효성검사

 //8자리 이상, 대문자/소문자/숫자/특수문자 모두 포함되어 있는 지 검사
 //(?=.*?문자) : 각각의 모든 대상을 '문자'로 검사한다. 
 var pwCheck = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-.]).{8,}$/;
 var hangleCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;

 document.querySelector("input[name='userPw']").addEventListener("blur", function(){
     if(!pwCheck.test(inko.ko2en(form.userPw.value))){
    	 $("#result2").text("비밀번호는 8자리 이상이어야 하며, 영문/숫자/특수문자 모두 포함해야 합니다.");
    	 $("#result2").css("color", "#ffb61a");
    	 form.userPw.focus();
     }else{
    	 $("#result2").text("사용가능한 비밀번호입니다.");
    	  $("#result2").css("color", "#03c75a");
         form.rePw.focus();
         check = true;
     }
 });

 
 
 document.querySelector("input[name='rePw']").addEventListener("blur", function(){
     check = false;
     if(this.value != document.querySelector("input[name='userPw']").value){
    	 $("#result3").text("비밀번호가 일치하지 않습니다.");
    	 $("#result3").css("color", "red");
         form.userPw.focus();
     }else{
    	 $("#result3").text("비밀번호가 일치합니다.");
    	  $("#result3").css("color", "#03c75a");
         check = true;
     }
 });

 
 
 function join(){
     if(!form.userId.value){
         alert("아이디를 입력해주세요.");
         form.userId.focus();
         return;
     }

     if(form.userId.value.length < 4 || form.userId.value.length > 16) {
         alert("아이디는 4자 이상, 16자 이하로 입력해주세요.");
         form.userId.focus();
         return;
     }

     if(!form.userPw.value){
         alert("패스워드를 입력해주세요.");
         form.userPw.focus();
         return;
     }

     if(check){
         form.submit();
     }
 }
   
   
   
   $all.on('click', function(){
       if($(this).is(":checked")){
           $inputs.prop('checked', true);
       }else{
           $inputs.prop('checked', false);
       }
   });
   
   // 회원가입 유효성 검사
   function send(){
      if(!$all.is(":checked")){
         alert("약관에 동의해주세요.");
         return;
      }
   
      
      if(!check){
         alert("아이디를 확인해주세요.");
         return;
      }
      
 /*     if(!phoneCheck){
          alert("휴대폰 인증을 다시 시도해주세요.");
          return;
       }
      */
      if($('input[name=userStatus]:radio:checked').length < 1){
    	  alert("회원 유형을 선택하세요.");
    	  return;
      }
      
      if(!joinForm.userPw.value){
         alert("패스워드를 확인해주세요.");
         return;
      }
      
      if(!joinForm.userName.value){
         alert("이름을 확인해주세요.");
         return;
      }

      joinForm.submit();
   }

   var code;
   var phoneCheck = false;
   //인증하기 펼치기
   function openCloseToc() {
	 
	      if($('#phone-check2').css('display')=='none'){
	         $('#phone-check2').css('display', 'block');
	      }
	      
	      var $userPhone=$('input[name=userPhone]').val();
	       $.ajax({
	          type:"GET", 
	          url:contextPath + "/user/UserPhoneOk.user?userPhone=" + $userPhone,
	          cache : false,
	          dataType: "json",
	          success:function(result){
	        	  code = result.verifyCode;
	       
	       console.log("verifyCode 1: " + result.verifyCode);
	       }
	       
	       });
	       console.log("verifyCode 2: " + result.verifyCode);
	       
	   }
   
   
   
   function checkCode(){
	 
	   var $userCode=$('input[name=userCode]').val();
	   if ($userCode == code){
		   $("#result4").text("인증번호가 일치합니다.");
		   $("#result4").css("color", "#03c75a");
		   phoneCheck = true;
	   }else{
		   $("#result4").text("인증번호가 일치하지 않습니다.");
				$("#result4").css("color", "red");
				$("input#userCode").focus();
	   }
	   console.log("내 코드: " + code);
	   console.log("user가 입력한 Code : " + $userCode);
	 
	       
	   
   }
  