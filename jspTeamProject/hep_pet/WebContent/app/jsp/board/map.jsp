<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유기동물 지도</title>
<style>
section#animalMap {
   width: 100%;
   margin-top: 8%;
}

div#map_wrap {
   width: 100%;
   position: relative;
}

.searchArea {
   width: 326px;
   height: 120px;
   border: 1px solid;
   background: #ffff;
   position: absolute;
   top: 3%;
   left: 1%;
   z-index: 998;
}

.mapZoomBtn {
   position: absolute;
   z-index: 999;
   top: 30%;
   left: 1%;
   width: 10%;
   height: 5%;
}

.zoomIn {
   width: 48px;
   margin-bottom: 4%;
   cursor: pointer;
}

.zoomOut {
   width: 48px;
   cursor: pointer;
}

#searchInputWrap {
   width: 100%;
   height: 50%;
   border-bottom: 1px solid;
   display: flex;
   align-items: center;
}

#searchInputInner {
   width: 100%;
   margin: 0 auto;
}

#searchInputInnerWrap {
   width: 87%;
   position: relative;
   margin: 0 auto;
}

#searchInput {
   border: 1px solid #ffb300;
   width: 90%;
   height: 23px;
   outline: none;
}

.searchImg {
   position: absolute;
   top: 0px;
   right: -1%;
   width: 25px;
   height: 25px;
   cursor: pointer;
   border: 1px solid #ffb300;
   background: #ffb300;
}

.searchImg img {
   max-width: 26px;
}

.showAnimalImg {
   z-index: 999;
   width: 450px;
   height: 250px;
   font-size: 16px;

}

.showAnimalImg img {
   width: 200px;
   height: 250px;
   float: left;

   
}
.showAnimalText {
	margin-left:10px;
    width: 240px;
	height: 100%;
   float: left;
display: flex;
    align-items: center;
        line-height: 35px;
  	
}

.showAnimalText ul{
list-style: none;
padding: 0;

}
.showAnimalText ul li:nth-child(1){
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 5px;

}
#searchSelectWrap{

    width: 100%;
    height: 50%;

}
.searchSelect{
	width: 100%;
	margin: 3% 2% 3%;
}

.addFloatL{
	float: left;
	font-size: 18px;
}
.addClearBoth{
	clear: both;
}
.searchSelectText{
	font-size: 12px;
	color: red;
}
div.searchSelect .addFloatL {
	width: 48%;
}
div.searchSelect select {
	width: 65%;
}
</style>
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/assets/css/map.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
</head>
<body>

   <!-- header -->
   <%@ include file="/app/jsp/fix/header.jsp"%>


   <!-- 지도를 표시할 div 입니다 -->
   <section id="animalMap">
      <div id="map_wrap">
         <div id="map" style="width: 100%; height: 900px;"></div>
         <div class="mapZoomBtn">
            <div onclick="zoomIn()" class="zoomIn">
               <img
                  src="https://cdn.discordapp.com/attachments/947836644889870356/949709356520333332/mapPlus.png">
            </div>
            <div onclick="zoomOut()" class="zoomOut">
               <img
                  src="https://cdn.discordapp.com/attachments/947836644889870356/949709356314820649/mapMinus.png">
            </div>
         </div>
         <div class="searchArea">
            <div id="searchInputWrap">
               <div id="searchInputInner">
                  <div id="searchInputInnerWrap">
                     <input id="searchInput">
                     <div class="searchImg" onclick="placeSearch()">
                        <img
                           src="https://cdn.discordapp.com/attachments/947836644889870356/949714357812621413/animal_search_icon.png">
                     </div>
                  </div>
               </div>
            </div>
            <div id="searchSelectWrap">
           		<div class="searchSelect">
	               <div class="addFloatL">축종
	                  <select>
	                     <option>모두</option>
	                     <option>개</option>
	                     <option>고양이</option>
	                     <option>기타동물</option>
	                  </select>
	               </div>
	               <div class="addFloatL">성별
	                  <select>
	                     <option>전체</option>
	                     <option>암컷</option>
	                     <option>수컷</option>
	                     <option>미상</option>
	                  </select>
	               </div>
	               <div class="addClearBoth searchSelectText">
	               		<p>*구조일 기준으로 한달 이내에 동물만 지도에 표시됩니다.</p>
	               </div>
               </div>
               
            </div>
         </div>
      </div>
      <div></div>
   </section>
   <!-- 검색창 -->
   <!--     <div id="header" class="Header" role="banner">
        <div class="titleName"><h1>HelpPet Map</h1></div>
        <div class="search_bar">
            <form id="search_keyword" onsubmit="" action="">
                <input type="text" class="search_input" name="search_input" placeholder="잃어버린 장소, 품종"> 
                <div class="btn_search_wrap">
                    <button class="btn_search"></button>
                </div>
            </form>
        </div>
    </div> -->



   <!-- 한줄짜리 검색창 -->
   <!-- <div id="search_wrap">
        <div class="search_top">
            <div class="search_select">
                <div class="search_input_line">
                    <div class="input-wrap">
                        <input type="text" placeholder="잃어버린 장소, 품종 검색" autocomplete="off">
                    </div>
                    <div class="btn_search_wrap">
                        <div class="btn_search"></div>
                    </div>
                </div>
            </div>
        </div>
    </div> -->



</body>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e8c046fffe25962d6ea1d0fbd0d4d7cf"></script> -->

<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e8c046fffe25962d6ea1d0fbd0d4d7cf&libraries=services"></script> -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e8c046fffe25962d6ea1d0fbd0d4d7cf&libraries=clusterer,services"></script>

   
<script>
$('#searchInput').focus();




//마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
    
 
    

    
    

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
//마커 클러스터러를 생성합니다 
var clusterer = new kakao.maps.MarkerClusterer({
    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
    minLevel: 6 ,// 클러스터 할 최소 지도 레벨          
    styles: [// calculator 각 사이 값 마다 적용될 스타일을 지정한다
    	{ 
        width : '42px', height : '42px',
        background: '#ffb300',
        borderRadius: '30px',
        textAlign: 'center',
        fontSize:  '18px',
        color: '#ffffff ',
        fontWeight: 'bold',
        lineHeight: '41px'
    },
    	{ 
        width : '80px', height : '80px',
        background: '#ffb300',
        borderRadius: '40px',
        textAlign: 'center',
        fontSize:  '24px',
        color: '#ffffff ',
        fontWeight: 'bold',
        lineHeight: '81px'
    },
    	{ 
        width : '100px', height : '100px',
        background: '#ffb300',
        borderRadius: '50px',
        textAlign: 'center',
        fontSize:  '24px',
        color: '#ffffff ',
        fontWeight: 'bold',
        lineHeight: '101px'
    }
    
    ]
});   

//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
var positions = [
    {
        content: "<div class='showAnimalImg'>"
            +"<img src='https://cdn.discordapp.com/attachments/485361381575622676/949222386438393906/0E4A955.jpg'>"
        +"<div class='showAnimalText'><ul>"
        +"<li>서울-송파-2022-00012</li>"
        +"<li>송파대로8길 17 파인타운9단지</li>"
        +"<li>[개] 믹스견</li>"
        +"<li>2022(년생)</li>"
        +"<li>흰색</li>"
        +"<li>3.5(Kg)</li>"
        +"</ul></div></div>",
                latlng: new kakao.maps.LatLng(37.502556680833365, 127.04267984516368)
    },
    {
        content: "<div class='showAnimalImg'>"
            +"<img src='https://cdn.discordapp.com/attachments/485361381575622676/949211335911157850/0E4A9590.jpg'>"
            +"<div class='showAnimalText'><ul>"
            +"<li>서울-송파-2022-00012</li>"
            +"<li>송파대로8길 17 파인타운9단지</li>"
            +"<li>[개] 믹스견</li>"
            +"<li>2022(년생)</li>"
            +"<li>흰색</li>"
            +"<li>3.5(Kg)</li>"
            +"</ul></div></div>",
                latlng: new kakao.maps.LatLng(37.50219493725588, 127.0362848342251)
    },
    {
        content: "<div class='showAnimalImg'>"
            +"<img src='http://www.animal.go.kr/files/shelter/2022/01/202202111502517.jpg'>"
            +"<div class='showAnimalText'><ul>"
            +"<li>서울-송파-2022-00012</li>"
            +"<li>송파대로8길 17 파인타운9단지</li>"
            +"<li>[개] 믹스견</li>"
            +"<li>2022(년생)</li>"
            +"<li>흰색</li>"
            +"<li>3.5(Kg)</li>"
            +"</ul></div></div>",
                latlng: new kakao.maps.LatLng(37.500152001731706, 127.0389117286536)
    },
    {
        content: "<div class='showAnimalImg'>"
            +"<img src='http://www.animal.go.kr/files/shelter/2022/01/202202111502517.jpg'>"
            +"<div class='showAnimalText'><ul>"
            +"<li>서울-송파-2022-00012</li>"
            +"<li>송파대로8길 17 파인타운9단지</li>"
            +"<li>[개] 믹스견</li>"
            +"<li>2022(년생)</li>"
            +"<li>흰색</li>"
            +"<li>3.5(Kg)</li>"
            +"</ul></div></div>",
                latlng: new kakao.maps.LatLng(37.5007545682003, 127.03715342752685)
    },
    {
        content: "<div class='showAnimalImg'>"
    +"<img src='http://www.animal.go.kr/files/shelter/2022/01/202202071502579.jpg'>"
    +"<div class='showAnimalText'><ul>"
    +"<li>서울-송파-2022-00012</li>"
    +"<li>송파대로8길 17 파인타운9단지</li>"
    +"<li>[개] 믹스견</li>"
    +"<li>2022(년생)</li>"
    +"<li>흰색</li>"
    +"<li>3.5(Kg)</li>"
    +"</ul></div></div>",
        latlng: new kakao.maps.LatLng(37.566826, 126.9786567)
    },
    {
        content: "<div class='showAnimalImg'>"
            +"<img src='https://cdn.discordapp.com/attachments/485361381575622676/949222386438393906/0E4A955.jpg'>"
            +"<div class='showAnimalText'><ul>"
            +"<li>서울-송파-2022-00012</li>"
            +"<li>송파대로8길 17 파인타운9단지</li>"
            +"<li>[개] 믹스견</li>"
            +"<li>2022(년생)</li>"
            +"<li>흰색</li>"
            +"<li>3.5(Kg)</li>"
            +"</ul></div></div>",
                latlng: new kakao.maps.LatLng(37.56627346605717, 126.97537029137618)
    },
    {
        content: "<div class='showAnimalImg'>"
            +"<img src='https://cdn.discordapp.com/attachments/485361381575622676/949211335911157850/0E4A9590.jpg'>"
            +"<div class='showAnimalText'><ul>"
            +"<li>서울-송파-2022-00012</li>"
            +"<li>송파대로8길 17 파인타운9단지</li>"
            +"<li>[개] 믹스견 · 2022(년생) · 흰색 · 3.5(Kg)</li>"
            +"</ul></div></div>",
    },
    {
        content: "<div class='showAnimalImg'>"
            +"<img src='http://www.animal.go.kr/files/shelter/2022/01/202202111502517.jpg'>"
            +"<div class='showAnimalText'><ul>"
            +"<li>서울-송파-2022-00012</li>"
            +"<li>송파대로8길 17 파인타운9단지</li>"
            +"<li>[개] 믹스견</li>"
            +"<li>2022(년생)</li>"
            +"<li>흰색</li>"
            +"<li>3.5(Kg)</li>"
            +"</ul></div></div>",
                latlng: new kakao.maps.LatLng(37.56814434881889, 126.97923282376965)
    },
    {
        content: "<div class='showAnimalImg'>"
            +"<img src='http://www.animal.go.kr/files/shelter/2022/01/202202111502517.jpg'>"
            +"<div class='showAnimalText'><ul>"
            +"<li>서울-송파-2022-00012</li>"
            +"<li>송파대로8길 17 파인타운9단지</li>"
            +"<li>[개] 믹스견</li>"
            +"<li>2022(년생)</li>"
            +"<li>흰색</li>"
            +"<li>3.5(Kg)</li>"
            +"</ul></div></div>",
                latlng: new kakao.maps.LatLng(37.56750656481782, 126.97282749059653)
    },
    {
        content: "<div class='showAnimalImg'>"
    +"<img src='http://www.animal.go.kr/files/shelter/2022/01/202202071502579.jpg'>"
    +"<div class='showAnimalText'><ul>"
    +"<li>서울-송파-2022-00012</li>"
    +"<li>송파대로8길 17 파인타운9단지</li>"
    +"<li>[개] 믹스견</li>"
    +"<li>2022(년생)</li>"
    +"<li>흰색</li>"
    +"<li>3.5(Kg)</li>"
    +"</ul></div></div>",
        latlng: new kakao.maps.LatLng(
              37.56302453309369, 126.983234342098)
    },
    {
        content: "<div class='showAnimalImg'>"
    +"<img src='http://www.animal.go.kr/files/shelter/2022/01/202202071502579.jpg'>"
    +"<div class='showAnimalText'><ul>"
    +"<li>서울-송파-2022-00012</li>"
    +"<li>송파대로8길 17 파인타운9단지</li>"
    +"<li>[개] 믹스견</li>"
    +"<li>2022(년생)</li>"
    +"<li>흰색</li>"
    +"<li>3.5(Kg)</li>"
    +"</ul></div></div>",
        latlng: new kakao.maps.LatLng(
              37.561480651901825, 126.97750887836023)
    }
];



var imageSrc = 'https://cdn1.iconfinder.com/data/icons/veterinary-1/512/15-128.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

    
//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

//지도에 컨트롤을 추가해야 지도위에 표시됩니다
//kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
 

var markers =[];

    
for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커의 위치
        image: markerImage
    });
/*     var marker2 = new kakao.maps.Marker({
        position: positions[i].latlng
    }); */
    
    markers.push(marker);
  
    // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: positions[i].content // 인포윈도우에 표시할 내용
    });


    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

clusterer.addMarkers(markers);





// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}



// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

// 키워드로 장소를 검색합니다

function placeSearch() {
   var searchInput = $('#searchInput').val();

   ps.keywordSearch(searchInput, placesSearchCB); 
}


// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}



      








//지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
/*     // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map
    }); */
    
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
		map: map,
	    image: markerImage // 마커이미지 설정 
	});


}

//지도 레벨은 지도의 확대 수준을 의미합니다
//지도 레벨은 1부터 14레벨이 있으며 숫자가 작을수록 지도 확대 수준이 높습니다
function zoomIn() {        
 // 현재 지도의 레벨을 얻어옵니다
 var level = map.getLevel();
 
 // 지도를 1레벨 내립니다 (지도가 확대됩니다)
 map.setLevel(level - 1);
 
 // 지도 레벨을 표시합니다
 displayLevel();
}    

function zoomOut() {    
 // 현재 지도의 레벨을 얻어옵니다
 var level = map.getLevel(); 
 
 // 지도를 1레벨 올립니다 (지도가 축소됩니다)
 map.setLevel(level + 1);
 
 
 // 지도 레벨을 표시합니다
 displayLevel(); 
}    




</script>

</html>