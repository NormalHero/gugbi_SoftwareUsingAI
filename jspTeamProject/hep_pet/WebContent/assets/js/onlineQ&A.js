// var form = document.inputForm


// // document.querySelector("input[name='userName']").addEventListener("blur",function(){
// //     if(!form.test(form.userName.value)){
// //         document.getElementById("nameCheck").innerHTML="이름을 입력해주세요."
// //         form.userName.focus();
// //     }else if()
// // });


// function check(){
//     if(!form.userName.value){
//         document.getElementsByName("userName").innertext = "이름을 입력해주세요.";
//         form.userName.focus();
//         return;
//     }
//     if(!form.userEmail.value){
//         document.getElementsByName("userName").innertext = "이메일을 입력해주세요.";
//         form.userEmail.focus();
//         return;
//     }
        
//     if(!form.userContent.value){
//         document.getElementsByName("userName").innertext = "내용을 입력해주세요.";
//         form.userContent.focus();
//         return;
//     }
// }

    
//     function agreeCheck(){
//         var chk = form.check_privacy.checked;
        


//         if(!chk){
//             alert("약관에 동의해주세요.");
//         }else{
//             form.submit();
//         }
//     }

var form = document.inputForm
var $check = $inputForm.check;

function agreeCheck(){
    var chk = form.check_privacy.checked;

    if(!form.userName.value){
        document.getElementsByName("userName").innertext = "이름을 입력해주세요.";
        form.userName.focus();
        return;
    }
    if(!form.userEmail.value){
        document.getElementsByName("userName").innertext = "이메일을 입력해주세요.";
        form.userEmail.focus();
        return;
    }

    if(!form.userContent.value){
        document.getElementsByName("userName").innertext = "내용을 입력해주세요.";
        form.userContent.focus();
        return;
    }

    if(!chk){
        alert("약관에 동의해주세요.");
    }else{
        form.submit();
    }
}