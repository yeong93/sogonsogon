<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<!-- jQuery -->
<script src="//code.jquery.com/jquery.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>

<style>
   @font-face {
      font-family: "InfinitySans-RegularA1";
      src:url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/InfinitySans-RegularA1.woff")
         format("woff");
      font-weight: normal;
      font-style: normal;
   }
   
   @font-face {
      font-family: 'GmarketSansMedium';
      src:url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
         format('woff');
      font-weight: normal;
      font-style: normal;
   }
   .empty {
      width: 100%;
      height: 100px;
   }
   
   body {
      font-family: "InfinitySans-RegularA1";
   }
   
   .btn, #btn2 {
      background-color: #ffce54;
      border: none;
      border-radius: 16px;
      clear: both;
   }
   
   .container {max-width: 720px;
   }
   
   h3 {font-family: 'GmarketSansMedium';}
   
    #tags{
        width: 80px;
        height: 30px;
        float: left;
        margin-right: 3px;
    }

   .plusbutton{
      background-color: rgb(241, 158, 48);
      width: 15px;
      height: 15px;
      border-radius: 10px;
      line-height: 12px;
      text-align: center;
      font-size: 20px;
      float: left;
      margin: 5.2px 0px 0px 4px;
      cursor: pointer;
      color: white;
   }
   .tagform{
      float: left;
   }
   .tagbox{
      clear: both;
      width: 100%;
      height: 40px;
   }
</style>
<title>방 만들기</title>
</head>

<body>
 <jsp:include page="../common/header.jsp" />
 
   <div class="empty"></div>
   <div class="container">
      <h3>방 만들기</h3>
      <hr>
      
      <form action="createRoom" method="post" role="form" onsubmit="return validate();">
         <div class="form-group">
            <label for="exampleFormControlInput1">방 이름</label> 
            <input type="text" class="form-control" id="title" name="roomTitle"
               placeholder="방 이름을 작성해주세요."  style="width: 400px;">
         </div>
         
       
         <div class="form-group">
         	<label for="exampleFormControlInput1">개설일</label> 
            <span class="my-0" id="today" ></span>
      	</div>

      <div class="form-group">
         <input type="radio" id="o" name="roomOpen"  class="open"  value="Y"> <label for="o">공개</label>  &nbsp;
         <input type="radio" id="c" name="roomOpen"  class="open"  value="N"> <label for="c">비공개</label>  
         <input type="password" name="roomPassword"  class="form-control" style="width: 250px;" placeholder="비밀번호를 입력해 주세요.">
      </div>

         <div class="form-group">
            <label for="exampleFormControlInput1">카테고리</label> <br>
            <select class="custom-select" id="category" name="roomType" style="width: 150px;">
                  <option value="1">IT</option>
                  <option value="2">공모전</option>
                  <option value="3">면접</option>
                  <option value="4">전공</option>
                  <option value="5">외국어</option>
                  <option value="6">기타</option>
                </select>
         </div>

         <div class="form-group">
            <label for="exampleFormControlInput1">참가 인원 수</label>
            <input type="number" class="form-control maxNumber" name="roomMaxNumber" maxlength="2" style="width: 150px;">
         </div>
         
         <div class="form-group">
            <label for="exampleFormControlTextarea1">방 소개</label>
            <textarea class="form-control" id="content" name="roomContent" rows="10" style="resize: none;"
            placeholder="방에 대한 간략한 소개를 입력해주세요."></textarea>
         </div>
            
         
            <div class="form-group">
                <label for="exampleFormControlTextarea1" class="tagform">태그 입력</label>
	            <div class="plusbutton">+</div>
	            <div class="tagbox">
	               <input type="text" class="form-control tags"  id="tags" name="roomTag">
	               <input type="text" class="form-control tags"  id="tags" name="roomTag">
	               <input type="text" class="form-control tags"  id="tags" name="roomTag">
	            </div>
   
		         <button type="button" class="btn btn-secondary">목록으로</button>
		         &nbsp;
		         <button type="submit" class="btn btn-info">등록하기</button>
    	  </div>
	
   </form>
   </div>


   <script>
      // 오늘 날짜 출력 
      var today = new Date();
      var month = (today.getMonth()+1);
   
      var str = today.getFullYear() + "-"
            + (month < 10 ? "0"+month : month) + "-"
            + today.getDate();
      $("#today").html(str);


      
      // 유효성 검사 
      function validate() {
    	  // 방 이름
         if ($("#title").val().trim().length == 0) {
            alert("방 이름을 입력해 주세요.");
            $("#title").focus();
            return false;
         }
    	  
   	    // 공개 여부 -> 비공개 체크일때 제약조건확인하기
         if ($(".open").prop("checked") == 0) {
             alert("공개여부를 선택해주세요");
             $(".open").focus();
             return false;
          }
   	    
   	 	 // 참가 인원 수
         if ($(".maxNumber").val().trim().length == 0) {
            alert("참가 인원 수를 입력해주세요.");
            $(".maxNumber").focus();
            return false;
         }
   	  
     	  // 방 소개
         if ($("#content").val().trim().length == 0) {
            alert("방 소개를 입력해 주세요.");
            $("#content").focus();
            return false;
         }

    	  // 태그
         if ($(".tags").val().trim().length == 0) {
            alert("태그를 입력해주세요");
            
            var tag =  $(".tags");
            tag[0].focus();
            return false;
         }
      }

      // 태그 입력창 생성 + 2번까지
      $(".plusbutton").on("click", function(){
         $tag = $('<input type="text">').addClass("form-control").attr("id", "tags");
         $(".tagbox").append($tag);
      });
  

   </script>
</body>
</html>