
		
	
$(document).ready(function(){
	 var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
	 var reg = /^[가-힣]{2,4}$/;
	 var pass =/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
	 var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	 var phoneRule = /^\d{3}\d{3,4}\d{4}$/;
	 var id = $('#userid');
	 var name = $('#username');
	 var pw =$('#userpw');
	 var repw =$('#reuserpw');
	 var nick =$('#usernick');
	 var email =$('#useremail');
	 var phone  =$('#userphone');
	 
$('#userid').on("propertychange change keyup paste input" ,function(event) {
	if(!idReg.test($('#userid').val() ) ) {
        $('#list1').html("<i class='none_text'>i  영문자로 시작하는 6~20자 ");
        } else {
    	$('#none_text').html("<span>사용가능</span>");
    }
})



});  





function checkjoin() {
	
	 var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
	 var reg = /^[가-힣]{2,4}$/;
	 var pass =/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
	 var emailRule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	 var phoneRule = /^\d{3}\d{3,4}\d{4}$/;


	 
	 var id = $('#userid');
	 var name = $('#username');
	 var pw =$('#userpw');
	 var repw =$('#reuserpw');
	 var nick =$('#usernick');
	 var email =$('#useremail');
	 var phone  =$('#userphone');
	 
	 
	 
	 
		if(!idReg.test( $(id).val() ) ) {
         alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
         $(id).focus();
         return false;
	 	}

		if(!reg.test( $(name).val() ) ) {
	         alert("이름을 제대로 입력해주세요");
	         $(name).focus();
	         return false;
		 	}
		if(!pass.test( $(pw).val() ) ) {
	         alert("비밀번호는 문자 숫자를 포함해 8자 이상입력해주세요");
	         $(pw).focus();
	         return false;
		 	}

        if($(pw).val()!=$(repw).val()){
            alert("비밀번호가 일치하지 않음");
            $(repw).focus();
            return false;

        }
        
        if($(nick).val() == ""){
            alert("닉네임을 입력해주세요");
            $(nick).focus();
            return false;

        }
    	if(!emailRule.test( $(email).val() ) ) {
	         alert("이메일을 확인해주세요");
	         $(email).focus();
	         return false;
		 	}
    	
    	
    	if(!phoneRule.test( $(phone).val() ) ) {
	         alert("핸드폰번호를 확인해주세요");
	         $(phone).focus();
	         return false;
		 	}

        document.join_form.submit();{

        }

    }



// 이거왜 name은 인식하고ㅓ id는 왜 인식못함 ㅜㅜ