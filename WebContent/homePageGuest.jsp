<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Nhà hàng Phú Gia</title>
        <link rel="stylesheet" href="./guest/css/normalize.css">
        <link rel="stylesheet" href="./guest/css/main.css" media="screen" type="text/css">
        <link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="./guest/css/bootstrap.css">
        <link rel="stylesheet" href="./guest/css/style-portfolio.css">
        <link rel="stylesheet" href="./guest/css/picto-foundry-food.css" />
        <link rel="stylesheet" href="./guest/css/jquery-ui.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link rel="icon" href="../guest/favicon-1.ico" type="image/x-icon">
    </head>

    <body>

        <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="background-color: #0A99D1;">
            <div class="container">
                <div class="row">
                <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">Restaurant</a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav main-nav  clear navbar-right ">
                            <li><a class="navactive color_animation" href="#top">WELCOME</a></li>
                            <li><a class="color_animation" href="#story">GIỚI THIỆU</a></li>
                            <li><a class="color_animation" href="#pricing">MÓN ĂN</a></li>
                            <li><a class="color_animation" href="#beer">THỨC UỐNG</a></li>
                             <li><a class="color_animation" href="#contact">LIÊN HỆ</a></li>
                            <li><a class="color_animation" href="dangNhap.jsp">ĐĂNG NHẬP</a></li>
                           
                        </ul>
                    </div><!-- /.navbar-collapse -->
                </div>
            </div><!-- /.container-fluid -->
        </nav>
         
        <div id="top" class="starter_container bg" >
            <div class="follow_container">
                <div class="col-md-6 col-md-offset-3">
                    <h2 class="top-title">Phú Gia Restaurant</h2>
                    <h2 class="white second-title"></h2>
                    <hr>
                </div>
            </div>
        </div>

        <!-- ============ About Us ============= -->

        <section id="story" class="description_content">
            <div class="text-content container">
                <div class="col-md-6">
                    <h1>Thông tin về chúng tôi</h1>
                    <div class="fa fa-cutlery fa-2x"></div>
                    <p class="desc-text">Nhà hàng Phú Gia từ lâu đã trở thành điểm hẹn lý tưởng của những bạn trẻ năng động hay những bữa cơm gia đình ấm cúng sau mỗi ngày làm việc căng thẳng. Nơi đây gần như là không gian ẩm thực phác họa một cách rõ nét những cung bậc của văn hóa đồng quê,đương đại, từ cách bài trí, sắp đặt  tạo cảm giác ấm cúng hơn cho thực khách khi đến nơi đây, hơn nữa chất liệu đều mang một âm sắc rõ nét và rất yên tĩnh, phù hợp cho những thực khách không thích sự ồn ào.</p>
                </div>
                <div class="col-md-6">
                    <div class="img-section">
                       <img src="./guest/images/hau.jpg" width="250" height="220">
                       <img src="./guest/images/so-huyet.jpg" width="250" height="220">
                       <div class="./guest/img-section-space"></div>
                       <img src="./guest/images/cua.jpg"  width="250" height="220">
                       <img src="./guest/images/corn.jpg"  width="250" height="220">
                   </div>
                </div>
            </div>
        </section>


       <!-- ============ Pricing  ============= -->


        <section id ="pricing" class="description_content">
             <div class="pricing background_content">
                <h1><span>Món ăn</span> giá cả phải chăng</h1>
             </div>
            <div class="text-content container"> 
                <div class="container">
                    <div class="row">
                        <div id="w">
                            <ul id="filter-list" class="clearfix">
                                <li class="filter" data-filter="all">Tất cả</li>
                                <li class="filter" data-filter="breakfast">Lẩu</li>
                                <li class="filter" data-filter="special">Hải sản</li>
                                <li class="filter" data-filter="desert">Đồ nướng</li>
                                <li class="filter" data-filter="dinner">Khuyên dùng</li>
                            </ul><!-- @end #filter-list -->    
                            <ul id="portfolio">
                                <li class="item breakfast"><img src="./guest/images/food_icon01.jpg" alt="Food" >
                                    <h2 class="white">100k</h2>
                                </li>

                                <li class="item dinner special"><img src="./guest/images/food_icon02.jpg" alt="Food" >
                                    <h2 class="white">50k</h2>
                                </li>
                                <li class="item dinner breakfast"><img src="./guest/images/food_icon03.jpg" alt="Food" >
                                    <h2 class="white">99k</h2>
                                </li>
                                <li class="item special"><img src="./guest/images/food_icon04.jpg" alt="Food" >
                                    <h2 class="white">66k</h2>
                                </li>
                                <li class="item dinner"><img src="./guest/images/food_icon05.jpg" alt="Food" >
                                    <h2 class="white">55k</h2>
                                </li>
                                <li class="item special"><img src="./guest/images/food_icon06.jpg" alt="Food" >
                                    <h2 class="white">199k</h2>
                                </li>
                                <li class="item desert"><img src="./guest/images/food_icon07.jpg" alt="Food" >
                                    <h2 class="white">123k</h2>
                                </li>
                                <li class="item desert breakfast"><img src="./guest/images/food_icon08.jpg" alt="Food" >
                                    <h2 class="white">321k</h2>
                                </li>
                            </ul><!-- @end #portfolio -->
                        </div><!-- @end #w -->
                    </div>
                </div>
            </div>  
        </section>


        <!-- ============ Our Beer  ============= -->


        <section id ="beer" class="description_content">
            <div  class="beer background_content">
                <h1>Là  <span>Địa điểm</span> để bạn tận hưởng</h1>
            </div>
            <div class="text-content container"> 
                <div class="col-md-5">
                   <div class="img-section">
                       <img src="./guest/images/beer_spec.jpg" width="100%">
                   </div>
                </div>
                <br>
                <div class="col-md-6 col-md-offset-1">
                    <h1>Thức uốngs</h1>
                    <div class="icon-beer fa-2x"></div>
                    <p class="desc-text">Ở đây tại Nhà hàng, chúng tôi đã nói về tình yêu của bia. Hương vị mới và táo bạo bước vào cửa của chúng tôi mỗi tuần, và chúng tôi có thể giúp đỡ nhưng thể hiện chúng ra. Mặc dù chúng tôi thích những tác phẩm kinh điển, nhưng chúng tôi luôn say mê khám phá những điều mới mẻ, vì vậy hãy dừng lại và trải nghiệm công việc của chúng tôi một cách tốt nhất.</p>
                </div>
            </div>
        </section>


      

        
        <!-- ============ Featured Dish  ============= -->

        <section id="featured" class="description_content">
            <div  class="featured background_content">
                <h1>Nơi lý tưởng cho bạn  <span>ăn uống</span></h1>
            </div>
            <div class="text-content container"> 
                <div class="col-md-6">
                    <h1>Trải nghiệm</h1>
                    <div class="icon-hotdog fa-2x"></div>
                    <p class="desc-text">Mỗi thực phẩm đều được làm thủ công vào lúc bình minh, chỉ sử dụng những nguyên liệu đơn giản nhất để mang lại mùi và hương vị vẫy gọi cả khối. Dừng lại bất cứ lúc nào và trải nghiệm sự đơn giản tốt nhất của nó.</p>
                </div>
                <div class="col-md-6">
                    <ul class="image_box_story2">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img src="./guest/images/slider1.jpg"  alt="...">
                                    <div class="carousel-caption">
                                        
                                    </div>
                                </div>
                                <div class="item">
                                    <img src="./guest/images/slider2.jpg" alt="...">
                                    <div class="carousel-caption">
                                        
                                    </div>
                                </div>
                                <div class="item">
                                    <img src="./guest/images/slider3.JPG" alt="...">
                                    <div class="carousel-caption">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ul>
                </div>
            </div>
        </section>

        <!-- ============ Reservation  ============= -->

        <section  id="reservation"  class="description_content">
            <div class="featured background_content">
                <a href=""><h1>ĐĂNG NHẬP</h1></a>
            </div>
           
        </section>

        <!-- ============ Social Section  ============= -->
      
        <section class="social_connect">
            <div class="text-content container"> 
                <div class="col-md-6">
               <!--      <span class="social_heading">Theo dõi chúng tôi</span> -->
                    <ul class="social_icons">
                        <li><a class="icon-twitter color_animation" href="#" target="_blank"></a></li>
                        <li><a class="icon-github color_animation" href="#" target="_blank"></a></li>
                        <li><a class="icon-linkedin color_animation" href="#" target="_blank"></a></li>
                        <li><a class="icon-mail color_animation" href="#"></a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                   <!--  <span class="social_heading">Số điện thoại</span> -->
                    <span class="social_info"><a class="color_animation" href="tel:883-335-6524">(+84) 702 364 886</a></span>
                </div>
            </div>
        </section>

        <!-- ============ Contact Section  ============= -->

        <section id="contact">
            <div class="map">
               <!--  <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3618.664063989472!2d91.8316103150038!3d24.909437984030877!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x37505558dd0be6a1%3A0x65c7e47c94b6dc45!2sTechnext!5e0!3m2!1sen!2sbd!4v1444461079802" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
                -->
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3829.1262184519405!2d107.97848493080434!3d16.316493802397833!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31418621bb7d0413%3A0x3e56a29dd082f043!2zQ-G6o25oIETGsMahbmcgQmF5!5e0!3m2!1svi!2s!4v1585971736802!5m2!1svi!2s"  width="100%" height="450" frameborder="0" style="border:0" allowfullscreen aria-hidden="false" tabindex="0"></iframe>
            </div>
        </section>

        <!-- ============ Footer Section  ============= -->

        <footer class="sub_footer">
            <div class="container">
                <div class="col-md-4"><p class="sub-footer-text text-center">&copy; Restaurant 2014, Theme by <a href="">ThemeWagon</a></p></div>
                <div class="col-md-4"><p class="sub-footer-text text-center">Back to <a href="#top">TOP</a></p>
                </div>
                <div class="col-md-4"><p class="sub-footer-text text-center">Built With Care By <a href="#" target="_blank">Us</a></p></div>
            </div>
        </footer>


        <script type="text/javascript" src="./guest/js/jquery-1.10.2.min.js"> </script>
        <script type="text/javascript" src="./guest/js/bootstrap.min.js" ></script>
        <script type="text/javascript" src="./guest/js/jquery-1.10.2.js"></script>     
        <script type="text/javascript" src="./guest/js/jquery.mixitup.min.js" ></script>
        <script type="text/javascript" src="./guest/js/main.js" ></script>

    </body>
</html>