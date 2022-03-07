<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
   <meta charset="UTF-8">
   <title>help_pet</title>
   <link href="https://hangeul.pstatic.net/hangeul_static/css/NanumBarunGothicYetHangul.css" rel="stylesheet">
   
   <style>
      .content{
         width: 1160px;
         height: auto;
         margin: 0 auto;
       /*   border: 1px solid red; */
         padding-bottom: 110px;
         margin-top: 3%;

      }
   .contentHeader{
         width: 50%;
         margin: 0 auto;
      }
   .wrapForm{
         width: 100%;
         margin: 0 auto;
      }


      .contentHeader{
         text-align: center;
         font-size: 28px;
      }

      .contentHeader div{
         font-size: 46px;
         font-weight: 100;
      }
      .bgForm{
        margin-bottom: 45px;
   		    height: 148px;
   		padding: 15px;
        margin-top: 50px;
        /* background: #fafafa; */
        /* background: #ffffdf; */
        background: #fffff0;;

      }
      ul.gridContainer{
         list-style: none;
         margin: 0;
         margin: 0;
         padding: 0;
         border: 0;
         font-family: 'Noto Sans KR', sans-serif;
         line-height:18px;
}
      }
      body {
         margin: 0px;
         padding: 0px;
      }
      .grid{
      border: 1px solid #e6e6e6;
         width: 285px;
         height: 400px;
    
      }
      
      /* flex로 바둑판 정렬 */
      /* .gridContainer{
         width: 100%;
      

         display: flex;
         flex-wrap: wrap;
         justify-content: space-between;
         margin-top: 50px;
         
         
      } 
      */
      .gridContainer{
         width: 100%;
         

         margin-top: 50px;
         display: grid;
         grid-template-columns: repeat(4, 1fr);
         grid-column-gap: 4px;
         grid-row-gap: 30px;
         
          /* display: inline-block;  */
         
      }
      
       .gridContainer li{
        
        /*  margin-left: 10px; */
          /* float: left; */
      } 
    /*   .gridContainer  li:nth-child(4n+1){margin-left: 0;} */


      .g_img {
         width: 285px;
         height: 100%;
         position: relative;

      }

      .g_img > img {
         width: 100%;
         height: 100%;
      }
      .g_img > p{
         position: absolute;
         top: -4px;
         left: 12px;
      
         border-radius: 30px;
         padding: 5px 10px;
         color: #fff;

         font-weight: 600;
      }
      .statusProtect{
         background-color: #4486bc;
      }
      .statusClose{
      background-color: #444444;
      
      }


      
      




      .btnWrap button{
        	width: 196px;
            height: 40px;
            background-color: #ffb300;
            border: #fff solid 1px;
            color: #fff;
            font-family: 'NanumBarunGothicYetHangul';
            font-weight: bold;
            font-size: 18px;
      }
      .g_text {
         position: absolute;
         display: flex;
         align-items: center;
         justify-content: center;
         display: block;
         background-color: rgba(0, 0, 0, 0.6);
    
         height: 100%;
         width: 100%;

         display: none;
         top: 0;
      
        
      }

      .g_text p {
         font-size: 18px;
      }

      .g_text #g_textIn p>b {
         display: inline-block;
         min-width: 78px;
         font-size: 18px;
         font-weight: bold;
      }
      
      
            #g_textIn p {
         color: white;
       
       

         
      }
      div#genImgDiv{
		    position: absolute;
		    top: 5px;
		    left: 6px;
      }
      #statusImg{
         position: absolute;
         top: 5px;
         left: 5px;
      }
      
      
      
      
      .paging{
         width: 100%;
         text-align: center;
         margin-top: 55px;
         
      }
      .paging a{
         text-decoration-line: none;
         display: inline-block;
         font-weight: 400;
         width: 40px;
         height: 40px;
         line-height: 40px;
         margin: 0;
         box-sizing: border-box;
         color: #333;
      }
      
      #searchForm{
      	height: 100%;
      }
      .formInnerWrap{
      	width: 100%;
      	height: 100%;
      	position: relative;
      	
      }
      .formTop{
      	height: 100%;
      }
      .formInnerWrap .formTop{
      	
	    display: flex;
	    align-items: center;
	    justify-content: center;
      	
      }
    
          .btnWrap{
	    position: absolute;
		right: 138px;
        bottom: 0px;
      }
      .dateDiv{
            margin-right: 15px;
            }
      
      
    .dateIntput{
         width: 160px;
         height: 42px;
         border: 0.5px solid ;
         padding-left: 5px;
      }
      .selectWrap select{
         width: 160px;
               height: 44px;
               border: 0.5px solid ;
               padding-left: 5px;

      } 
      #topImg{
		width: 100%;
    	height: 59vh;

      	background-image: url("https://cdn.discordapp.com/attachments/947836644889870356/948806487302627328/ListBannerpng.png");
      	background-repeat: no-repeat;
      	background-size: contain;
      	display: flex;
      	align-items: center;
      	margin-top: 152px;
      	position: relative;
      }
	.contentHeader{
		position: absolute;
    top: 232px;
    left: 719px;
	}
	.contentHeader h1{
		color: #ffb300;
	}
	#listTopWrap{
		width: 100%;
		    min-height: 550px;
		    overflow: hidden;
	}
	.dateIntput, .selectWrap select{
	border-radius: 5px;
	    font-size: 16px;
	font-family: 'NanumBarunGothicYetHangul';

	
	overflow: visible ;

	}
	.statusTextNotofi{
	position: absolute;
    bottom: 0px;
    width: 100%;
    background: rgba(255,179,0,73%);
    text-align: center;
    color: black;
    font-weight: bold;
    font-size: 18px;
	}
	.statusTextFinish{
	position: absolute;
    bottom: 0px;
    width: 100%;
	background: rgba(105,105,105,73%);
    text-align: center;
    color: black;
    font-weight: bold;
    font-size: 18px;
	}
	
	
	@font-face {
    font-family: 'GowunDodum-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff%27) format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'IBMPlexSansKR-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@import url("fonts.googleapis.com/earlyaccess/notosanskr.css");



   </style>
</head>
<body>
   <!-- 헤더 영역 -->
  	<%@ include file="../fix/header.jsp" %>


<!-- 중간 이미지 -->
<div id="listTopWrap">
	<div id="topImg">
		        <div class="contentHeader">
	               <h1>보호동물 공고</h1>
	            </div>
	            <div ></div>
	</div>
</div>
<!-- wrapForm -->

   <section>
         <div class="content">
<!--             <div class="contentHeader">
               <h1>보호동물 공고</h1>
               <div>|</div>
            </div> -->
               <!-- 보호동물 검색 form 시작 -->
            <div class="bgForm">
              
                  <form id="searchForm">
                 		
	                    <div class="formInnerWrap">
	                    	<div class="formTop">
		                        <div class="dateDiv">
		                          	 <input type="date" placeholder="유기날짜(시작일)" class="dateIntput">~<input type="date" placeholder="유기날짜(종료일)" class="dateIntput">
		                        </div>
	                           
		                        <div class="selectWrap">
		                           <select>
		                              <option>종류</option>
		                              <option value="">개</option>
		                              <option value="">고양이</option>
		                              <option value="">기타동물</option>
		                           </select>
		                           <select>
		                              <option >품종</option>
		                             <!-- 종류를 선택하지 않았다면 품종은 '품종'만 선택 가능하게 구현
		                              js와 유기동뮬API를 사용하여 종류의 값에 따라 알맞는 품종을 가져오게 구현 -->
		                              <option value="">개</option>
		                              <option value="">고양이</option>
		                              <option value="">기타동물</option>
		                           </select>
		                           <select>
		                              <option >중성화여부</option>
		                              <option value="">예</option>
		                              <option value="">아니요</option>
		                              <option value="">미상</option>
		                           </select>
		                        </div>
	                        </div>
                        
	                        <div class="btnWrap">
	                           <div>
	                              <button type="submit">검색</button>
	                            <!--   <button type="reset">초기화</button> -->
	                           </div>
	                      	</div>
                      </div>
                       
                  </form>
               
            </div>
            <!-- 보호동물 검색 form 종료-->
         <ul class="gridContainer">
      <li class="grid" onclick="window.location.href = '${pageContext.request.contextPath}/app/jsp/board/petSearchView.jsp';">
         <div class="g_img">
            <img src="http://www.animal.go.kr/files/shelter/2022/01/202202111502271.jpg" height="221px">
<!--             <div id="statusImg">
               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949170539753271336/protect_safe_icon.png">
            </div> -->
            <div id="genImgDiv">
               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949669481741942784/menIcon.png">
            </div>
            <div class="statusTextNotofi"><p>보호중</p></div>
            <div class="g_text">
               <div id="g_textIn">
                  <p><b>공고번호</b>경기-용인-2022-00113</p>
                  <p><b>품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</b>[개]리트리버</p>
                  <p><b>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별</b>수</p>
                  <p><b>발견장소</b>서울 서초구</p>
               </div>
            </div>
         </div>
      </li>
      <li class="grid" onclick="window.location.href = '${pageContext.request.contextPath}/app/jsp/board/petSearchView.jsp';">
         <div class="g_img">
            <img src="http://www.animal.go.kr/files/shelter/2022/01/202202091402517.jpg" height="221px">
<!--             <div id="statusImg">
               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949174463717580851/protect_close_icon.png">
            </div> -->
            <div id="genImgDiv">
               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949669481947488296/womanIcon.png">
            </div>
            <div class="statusTextFinish"><p>종료(반환)</p></div>
            <div class="g_text">
               <div id="g_textIn">
                  <p><b>공고번호</b>경기-용인-2022-00113</p>
                  <p><b>품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</b>[개]리트리버</p>
                  <p><b>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별</b>수</p>
                  <p><b>발견장소</b>서울 서초구</p>
               </div>
            </div>
         </div>
      </li>
      <li class="grid" onclick="window.location.href = '${pageContext.request.contextPath}/app/jsp/board/petSearchView.jsp';">
         <div class="g_img">
            <img src="http://www.animal.go.kr/files/shelter/2022/01/202202071502579.jpg" height="221px">
<!--             <div id="statusImg">
               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949170539753271336/protect_safe_icon.png">
            </div> -->
	            <div id="genImgDiv">
	               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949669481741942784/menIcon.png">
	            </div>
            <div class="statusTextFinish"><p>종료(반환)</p></div>
            <div class="g_text">
               <div id="g_textIn">
                  <p><b>공고번호</b>경기-용인-2022-00113</p>
                  <p><b>품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</b>[개]리트리버</p>
                  <p><b>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별</b>수</p>
                  <p><b>발견장소</b>서울 서초구</p>
               </div>
            </div>
         </div>
      </li>
      <li class="grid" onclick="window.location.href = '${pageContext.request.contextPath}/app/jsp/board/petSearchView.jsp';">
         <div class="g_img">
            <img src="http://www.animal.go.kr/files/shelter/2022/01/202202111502517.jpg" height="221px">
<!--             <div id="statusImg">
               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949174463717580851/protect_close_icon.png">
            </div> -->
            <div id="genImgDiv">
               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949669481947488296/womanIcon.png">
            </div>
            <div class="statusTextNotofi"><p>보호중</p></div>
            <div class="g_text">
               <div id="g_textIn">
                  <p><b>공고번호</b>경기-용인-2022-00113</p>
                  <p><b>품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</b>[개]리트리버</p>
                  <p><b>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별</b>수</p>
                  <p><b>발견장소</b>서울 서초구</p>
               </div>
            </div>
         </div>
      </li>
      <li class="grid" onclick="window.location.href = '${pageContext.request.contextPath}/app/jsp/board/petSearchView.jsp';">
         <div class="g_img">
            <img src="http://www.animal.go.kr/files/shelter/2022/01/202202111502271.jpg" height="221px">
<!--             <div id="statusImg">
               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949170539753271336/protect_safe_icon.png">
            </div> -->
            <div id="genImgDiv">
               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949669481741942784/menIcon.png">
            </div>
            <div class="statusTextNotofi"><p>보호중</p></div>
            <div class="g_text">
               <div id="g_textIn">
                  <p><b>공고번호</b>경기-용인-2022-00113</p>
                  <p><b>품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</b>[개]리트리버</p>
                  <p><b>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별</b>수</p>
                  <p><b>발견장소</b>서울 서초구</p>
               </div>
            </div>
         </div>
      </li>
      <li class="grid" onclick="window.location.href = '${pageContext.request.contextPath}/app/jsp/board/petSearchView.jsp';">
         <div class="g_img">
            <img src="http://www.animal.go.kr/files/shelter/2022/01/202202091402517.jpg" height="221px">
<!--             <div id="statusImg">
               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949174463717580851/protect_close_icon.png">
            </div> -->
            <div id="genImgDiv">
               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949669481947488296/womanIcon.png">
            </div>
            <div class="statusTextFinish"><p>종료(반환)</p></div>
            <div class="g_text">
               <div id="g_textIn">
                  <p><b>공고번호</b>경기-용인-2022-00113</p>
                  <p><b>품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</b>[개]리트리버</p>
                  <p><b>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별</b>수</p>
                  <p><b>발견장소</b>서울 서초구</p>
               </div>
            </div>
         </div>
      </li>
      <li class="grid" onclick="window.location.href = '${pageContext.request.contextPath}/app/jsp/board/petSearchView.jsp';">
         <div class="g_img">
            <img src="http://www.animal.go.kr/files/shelter/2022/01/202202071502579.jpg" height="221px">
<!--             <div id="statusImg">
               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949170539753271336/protect_safe_icon.png">
            </div> -->
	            <div id="genImgDiv">
	               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949669481741942784/menIcon.png">
	            </div>
            <div class="statusTextNotofi"><p>보호중</p></div>
            <div class="g_text">
               <div id="g_textIn">
                  <p><b>공고번호</b>경기-용인-2022-00113</p>
                  <p><b>품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</b>[개]리트리버</p>
                  <p><b>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별</b>수</p>
                  <p><b>발견장소</b>서울 서초구</p>
               </div>
            </div>
         </div>
      </li>
      <li class="grid" onclick="window.location.href = '${pageContext.request.contextPath}/app/jsp/board/petSearchView.jsp';">
         <div class="g_img">
            <img src="http://www.animal.go.kr/files/shelter/2022/01/202202111502517.jpg" height="221px">
<!--             <div id="statusImg">
               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949174463717580851/protect_close_icon.png">
            </div> -->
            <div id="genImgDiv">
               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949669481947488296/womanIcon.png">
            </div>
            <div class="statusTextFinish"><p>종료(반환)</p></div>
            <div class="g_text">
               <div id="g_textIn">
                  <p><b>공고번호</b>경기-용인-2022-00113</p>
                  <p><b>품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</b>[개]리트리버</p>
                  <p><b>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별</b>수</p>
                  <p><b>발견장소</b>서울 서초구</p>
               </div>
            </div>
         </div>
      </li>
      <li class="grid" onclick="window.location.href = '${pageContext.request.contextPath}/app/jsp/board/petSearchView.jsp';">
         <div class="g_img">
            <img src="http://www.animal.go.kr/files/shelter/2022/01/202202111502271.jpg" height="221px">
<!--             <div id="statusImg">
               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949170539753271336/protect_safe_icon.png">
            </div> -->
            <div id="genImgDiv">
               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949669481741942784/menIcon.png">
            </div>
            <div class="statusTextNotofi"><p>보호중</p></div>
            <div class="g_text">
               <div id="g_textIn">
                  <p><b>공고번호</b>경기-용인-2022-00113</p>
                  <p><b>품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</b>[개]리트리버</p>
                  <p><b>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별</b>수</p>
                  <p><b>발견장소</b>서울 서초구</p>
               </div>
            </div>
         </div>
      </li>
      <li class="grid" onclick="window.location.href = '${pageContext.request.contextPath}/app/jsp/board/petSearchView.jsp';">
         <div class="g_img">
            <img src="http://www.animal.go.kr/files/shelter/2022/01/202202091402517.jpg" height="221px">
<!--             <div id="statusImg">
               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949174463717580851/protect_close_icon.png">
            </div> -->
            <div id="genImgDiv">
               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949669481947488296/womanIcon.png">
            </div>
            <div class="statusTextFinish"><p>종료(반환)</p></div>
            <div class="g_text">
               <div id="g_textIn">
                  <p><b>공고번호</b>경기-용인-2022-00113</p>
                  <p><b>품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</b>[개]리트리버</p>
                  <p><b>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별</b>수</p>
                  <p><b>발견장소</b>서울 서초구</p>
               </div>
            </div>
         </div>
      </li>
      <li class="grid" onclick="window.location.href = '${pageContext.request.contextPath}/app/jsp/board/petSearchView.jsp';">
         <div class="g_img">
            <img src="http://www.animal.go.kr/files/shelter/2022/01/202202071502579.jpg" height="221px">
<!--             <div id="statusImg">
               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949170539753271336/protect_safe_icon.png">
            </div> -->
	            <div id="genImgDiv">
	               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949669481741942784/menIcon.png">
	            </div>
            <div class="statusTextNotofi"><p>보호중</p></div>
            <div class="g_text">
               <div id="g_textIn">
                  <p><b>공고번호</b>경기-용인-2022-00113</p>
                  <p><b>품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</b>[개]리트리버</p>
                  <p><b>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별</b>수</p>
                  <p><b>발견장소</b>서울 서초구</p>
               </div>
            </div>
         </div>
      </li>
      <li class="grid" onclick="window.location.href = '${pageContext.request.contextPath}/app/jsp/board/petSearchView.jsp';">
         <div class="g_img">
            <img src="http://www.animal.go.kr/files/shelter/2022/01/202202111502517.jpg" height="221px">
<!--             <div id="statusImg">
               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949174463717580851/protect_close_icon.png">
            </div> -->
            <div id="genImgDiv">
               <img src="https://cdn.discordapp.com/attachments/947836644889870356/949669481947488296/womanIcon.png">
            </div>
            <div class="statusTextFinish"><p>종료(반환)</p></div>
            <div class="g_text">
               <div id="g_textIn">
                  <p><b>공고번호</b>경기-용인-2022-00113</p>
                  <p><b>품&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;종</b>[개]리트리버</p>
                  <p><b>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;별</b>수</p>
                  <p><b>발견장소</b>서울 서초구</p>
               </div>
            </div>
         </div>
      </li>

 

   </ul>

                  <!--페이징 -->
         <div class="paging">
            <a href="#" class="page" onclick="">1</a>
            <a href="#" class="page" onclick="">2</a>
            <a href="#" class="page" onclick="">3</a>
            <a href="#" class="page" onclick="">4</a>
            <a href="#" class="page" onclick="">5</a>
            <a href="#" class="page" onclick="">6</a>
            <a href="#" class="page" onclick="">7</a>
         </div>
         
   		
      </div>



   
         

   </section>
   <!-- content 종료-->


   <!-- 푸터 영역 -->
    <%@ include file="/app/jsp/fix/footer.jsp" %>
</body>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script>
   var nowpage = 4;
   var pages = document.querySelectorAll('a.page');
   pages.forEach(p =>{
      if(p.innerHTML == nowpage){
      console.log(p)
      p.style.color = "white";
      p.style.textDecoration = "underline";
      p.style.textUnderlinePosition = "under";
      p.style.background = "#ffb300";

      }
   })
      // $('.grid').hover(function () {
   //    console.log(this);
   //    $(this).find('.g_text').css('display', 'flex')
   // })
    $('.grid').hover(function(){
       
       $(this).find('.g_text').fadeIn(300);
      $(this).find('.g_text').css('display','flex');
    },function(){
       $(this).find('.g_text').fadeOut();

    })
   
</script>

</html>