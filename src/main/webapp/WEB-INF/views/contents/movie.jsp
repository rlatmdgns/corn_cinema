<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700&display=swap&subset=korean"
        rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/style.css">
</head>

<body>
        <div id="container">
            <!-- 영화 탭 콘텐츠 -->
            <div class="l_content">
                <div class="cinema-movie-wrap">
                    <h3 class="cinema-movie-title">최신개봉작</h3>
                    <ul class="cinema-movie">
                    
                    <c:forEach items ="${list}" var="newMovie">
                        <li>
                            <div class="movie-content">
                                <div class="movie_img">
                                    <a href="javascript:void(0);">
                                       <c:forEach items ="${newMovie.viewvo}"  var = "newMoiveView"> 
                                               <img src="${newMoiveView.view_path}">
                                            </c:forEach>
                                    </a>
                                </div>
                                
                                
                                
                                <div class="movie-info">
                                    <h3 class="movie-title">
                                        <a href="">
                                            <span class="age_ico age_12">${newMovie.film_rate}</span>${newMovie.title}
                                        </a>
                                    </h3>
                                    <div class="info-text-area">
                                        <span class="info-text"><fmt:formatDate value= "${newMovie.opening_day}" pattern="yyyy.MM.dd" /> 개봉</span>
                                        <span class="info-text">관람 평점:${newMovie.avg_score}</span>
                                    </div>
                                </div>
                                <div class="movie-btn-area">
                                    <a href="#" class="movie-btn">예매하기</a>
                                    <a href="#" class="movie-btn">상세보기</a>
                                </div>
                                
                            </div>
                        </li>
                       </c:forEach>
                       
                    </ul>
                </div>
            </div>
        </div>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".movie_img > a").on("mouseover focus", function () {
                event.stopPropagation();
                $(this).parent().siblings(".movie-btn-area").addClass("on");
            });
            $(".movie-btn-area a:last-child").on("focusout", function () {
                $(".movie-btn-area").removeClass("on");
            });
            $(".movie-content").on("mouseleave", function () {
                $(".movie-btn-area").removeClass("on");
            });
        });

        // var a = document.querySelector(".movie_img > a");
        // var b = document.querySelector(".movie-btn-area");
        // console.log(a);
        // console.log(b);
        // a.addEventListener("click", function(){
        //     console.log(b.classList.add("on"));
        // });
    </script>
</body>

</html>