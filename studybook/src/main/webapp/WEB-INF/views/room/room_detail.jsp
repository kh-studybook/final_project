<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
* {
  box-sizing: border-box;
}
.row{
	margin-top: 35px;
}

.row::after {
  content: "";
  clear: both;
  display: table;
}

[class*="col-"] {
  float: left;
  padding: 15px;
}

html {
  font-family: "Lucida Sans", sans-serif,NanumBarunGothicUltralight;
}

.aside {
  background-color: #33b5e5;
  padding: 15px;
  color: #ffffff;
  text-align: center;
  font-size: 14px;
  box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
  margin-top:20%;
}


/* For mobile phones: */
[class*="col-"] {
  width: 100%;
}

@media only screen and (min-width: 600px) {
  /* For tablets: */
  .col-s-1 {width: 8.33%;}
  .col-s-2 {width: 16.66%;}
  .col-s-3 {width: 25%;}
  .col-s-4 {width: 33.33%;}
  .col-s-5 {width: 41.66%;}
  .col-s-6 {width: 50%;}
  .col-s-7 {width: 58.33%;}
  .col-s-8 {width: 66.66%;}
  .col-s-9 {width: 75%;}
  .col-s-10 {width: 83.33%;}
  .col-s-11 {width: 91.66%;}
  .col-s-12 {width: 100%;}
}
@media only screen and (min-width: 768px) {
  /* For desktop: */
  .col-1 {width: 8.33%;}
  .col-2 {width: 16.66%;}
  .col-3 {width: 25%;}
  .col-4 {width: 33.33%;}
  .col-5 {width: 41.66%;}
  .col-6 {width: 50%;}
  .col-7 {width: 58.33%;}
  .col-8 {width: 66.66%;}
  .col-9 {width: 75%;}
  .col-10 {width: 83.33%;}
  .col-11 {width: 91.66%;}
  .col-12 {width: 100%;}
}

.inner_detail{
	padding:5% 0 0 20%;
}
.inner_detail .room_name{
	font_size:48px;
	font_weight:500px;
}

.sub-desc{
	margin-top: 17px;
    padding-bottom: 22px;
    font-size: 22px;
    line-height: 22px;
    color: #656565;
    font-family: NanumBarunGothicUltralight,sans-serif;
}

.tags .tag {
	margin: 6px 6px 6px 0;
    padding: 0 15px;
    height: 29px;
    font-size: 14px;
    line-height: 29px;
    border-radius: 29px;
    display: inline-block;
    background-color: #fff;
    border: 1px solid #e0e0e0;
    color: #656565;
}
</style>
</head>
<body>

<div class="row">
  <div class="col-7 col-s-9">
  	<div class="inner_detail">
    	<span class="room_name">ROOM 512</span>
    	<p class="sub-desc">ROOM 512 간단 소개 부분</p>
    		<div class="tags">
				<span class="tag">#스터디</span> 
				<span class="tag">#회의</span>
				<span class="tag">#세미나</span>
			</div>
    </div>
  </div>

  <div class="col-4 col-s-12">
    <div class="aside">
      <h2>What?</h2>
      <p>Chania is a city on the island of Crete.</p>
      <h2>Where?</h2>
      <p>Crete is a Greek island in the Mediterranean Sea.</p>
      <h2>How?</h2>
      <p>You can reach Chania airport from all over Europe.</p>
      <h2>How?</h2>
      <p>You can reach Chania airport from all over Europe.</p>
      <h2>How?</h2>
      <p>You can reach Chania airport from all over Europe.</p>
      <h2>How?</h2>
      <p>You can reach Chania airport from all over Europe.</p>
      <h2>How?</h2>
      <p>You can reach Chania airport from all over Europe.</p>
    </div>
  </div>
</div>

</body>
</html>
