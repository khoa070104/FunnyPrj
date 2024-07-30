<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/community.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>

<body>
<jsp:include page="./components/header.jsp"/>
<section class="category-header-area"
         style="background-image: url('${pageContext.request.contextPath}/icon/course_page_banner.png'); background-size: cover; background-position: right; padding: 30px">
    <div class="image-placeholder-3"></div>
    <div class="banner-community container-lg breadcrumb-container row align-items-center banner">
        <nav class="col-auto" aria-label="breadcrumb">
            <div style="font-size: 35px">Chào mừng bạn đến với FunnyCode</div>
            <div class="thamgia">
                <div>Muốn tham gia diễn đàn của FunnyCode ? </div>
                <a href="register.jsp"> Hãy đăng ký ngay</a>
            </div>
        </nav>
    </div>
</section>
<section class="category-course-list-area">
    <div class="container-lg">
        <div class="row">
            <div class="col-lg-9 container">
                <div class="row">
                    <!-- Danh mục -->
                    <div class="order-lg-first radius-10 mt-4 bg-white">
                        <div class="row bg-white d-flex justify-content-center">
                            <ul class="nav nav-tabs sNav-tabs" id="myTab" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" id="summary-tab" data-bs-toggle="tab" data-bs-target="#course-curriculum-box" type="button" role="tab" aria-controls="course-curriculum-box" aria-selected="false">Đề Thi Mới</button>
                                </li>
                            </ul>
                            <div class="tab-content mt-4" id="myTabContent">
                                <div class="tab-pane fade" id="description-box" role="tabpanel" aria-labelledby="author-tab">
                                    <div class="description-box view-more-parent">
                                        <div class="description-content-wrap">
                                            <div class="description-content">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Chương trình giảng dạy -->
                                <div class="tab-pane fade active show" id="course-curriculum-box" role="tabpanel" aria-labelledby="course-curriculum-box">
                                    <div class="course-curriculum-box">
                                        <div class="course-curriculum-accordion">
                                            <div class="dethi-body">
                                                <div class="mucluc">1</div>
                                                <div class="dethi">Đề Thi PT</div>
                                                <div style="width: calc(100% - 100px);">
                                                    <a href=""
                                                       class="description-dethi">MAD101_Test3_Su24_087424</a>
                                                    <a class="timepost-dethi">Thứ tư 10:20</a>
                                                </div>
                                            </div>
                                            <div class="dethi-body">
                                                <div class="mucluc">2</div>
                                                <div class="dethi">Đề Thi PT</div>
                                                <div style="width: calc(100% - 100px);">
                                                    <a href=""
                                                       class="description-dethi">ENM401_WSUM2024_PT2_Set2_612479</a>
                                                    <a class="timepost-dethi">Thứ tư 10:20</a>
                                                </div>
                                            </div>
                                            <div class="dethi-body">
                                                <div class="mucluc">3</div>
                                                <div class="dethi">Đề Thi PT</div>
                                                <div style="width: calc(100% - 100px);">
                                                    <a href=""
                                                       class="description-dethi">ENM301_WSUM2024_PT2_Set1_517235</a>
                                                    <a class="timepost-dethi">Thứ tư 10:20</a>
                                                </div>
                                            </div>
                                            <div class="dethi-body">
                                                <div class="mucluc">4</div>
                                                <div class="dethi">Đề Thi PT</div>
                                                <div style="width: calc(100% - 100px);">
                                                    <a href="" class="description-dethi">MLN131_Q2_2_089341</a>
                                                    <a class="timepost-dethi">Thứ tư 10:20</a>
                                                </div>
                                            </div>
                                            <div class="dethi-body">
                                                <div class="mucluc">5</div>
                                                <div class="dethi">Đề Thi PT</div>
                                                <div style="width: calc(100% - 100px);">
                                                    <a href=""
                                                       class="description-dethi">ENM401_RSUM2024_PT2_Set1_4514</a>
                                                    <a class="timepost-dethi">Thứ tư 10:20</a>
                                                </div>
                                            </div>
                                            <div class="dethi-body">
                                                <div class="mucluc">6</div>
                                                <div class="dethi">Đề Thi PT</div>
                                                <div style="width: calc(100% - 100px);">
                                                    <a href=""
                                                       class="description-dethi">ENM401_RSUM2024_PT2_Set1_4514</a>
                                                    <a class="timepost-dethi">Thứ tư 10:20</a>
                                                </div>
                                            </div>
                                            <div class="dethi-body">
                                                <div class="mucluc">7</div>
                                                <div class="dethi">Đề Thi PT</div>
                                                <div style="width: calc(100% - 100px);">
                                                    <a href=""
                                                       class="description-dethi">ENM401_RSUM2024_PT2_Set1_4514</a>
                                                    <a class="timepost-dethi">Thứ tư 10:20</a>
                                                </div>
                                            </div>
                                            <div class="dethi-body">
                                                <div class="mucluc">8</div>
                                                <div class="dethi">Đề Thi PT</div>
                                                <div style="width: calc(100% - 100px);">
                                                    <a href=""
                                                       class="description-dethi">ENM401_RSUM2024_PT2_Set1_4514</a>
                                                    <a class="timepost-dethi">Thứ tư 10:20</a>
                                                </div>
                                            </div>
                                            <div class="dethi-body">
                                                <div class="mucluc">9</div>
                                                <div class="dethi">Đề Thi PT</div>
                                                <div style="width: calc(100% - 100px);">
                                                    <a href=""
                                                       class="description-dethi">ENM401_RSUM2024_PT2_Set1_4514</a>
                                                    <a class="timepost-dethi">Thứ tư 10:20</a>
                                                </div>
                                            </div>
                                            <div class="dethi-body">
                                                <div class="mucluc">10</div>
                                                <div class="dethi">Đề Thi PT</div>
                                                <div style="width: calc(100% - 100px);">
                                                    <a href=""
                                                       class="description-dethi">ENM401_RSUM2024_PT2_Set1_4514</a>
                                                    <a class="timepost-dethi">Thứ tư 10:20</a>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>


                </div>
            </div>
            <div class="col-lg-3 filter-area">
                <div class="card border-0 radius-10">
                    <div id="collapseFilter" class="collapse show" aria-labelledby="headingOne"
                         data-parent="#accordion">
                        <div class="card-body p-0">
                            <div class="filter_type px-4 pt-4">
                                <div class="communicate-title">
                                    <i class="fa fa-line-chart" aria-hidden="true"></i>
                                    <h5 style="font-size: 17px;" class="fw-700 mb-4">Thống Kê Diễn Đàn</h5>
                                </div>
                                <ul class="ul" style="list-style: none;padding: 0;margin: 0;">
                                    <li class="ms-3">
                                        <div class="d-flex">
                                            <label>Chủ đề:</label>
                                            <div class="quantity">200</div>
                                        </div>
                                    </li>
                                    <li class="ms-3">
                                        <div class="d-flex">
                                            <label>Bài viết:</label>
                                            <div class="quantity">2000</div>
                                        </div>
                                    </li>
                                    <li class="ms-3">
                                        <div class="d-flex">
                                            <label>Thành viên:</label>
                                            <div class="quantity">1000</div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9">
                <div>
                    <h5 style="margin: 10px 0 20px 30px">CỘNG ĐỒNG</h5>
                </div>
                <div class="block-container">
                    <div class="uix_block-body--outer ">
                        <div class="communicate-list">
                            <div class="communicate-node">
                                <div class="communicate-image">
                                    <img src="./icon/4.png" alt="">
                                </div>
                                <div class="communicate-main">
                                    <div class="node-title"><a href="#" class="course-tieude">Chuyện Trò Linh
                                        Tinh</a></div>
                                    <div class="node-meta">
                                        <div class="node-statsMeta">
                                            <dl class="pairs pairs--inline">
                                                <dt><i class="fa--xf far fa-comment" aria-hidden="true"></i></dt>
                                                <dd>69</dd>
                                            </dl>
                                            <dl class="pairs pairs--inline">
                                                <dt><i class="fa--xf far fa-comments" aria-hidden="true"></i></dt>
                                                <dd>178</dd>
                                            </dl>
                                        </div>
                                    </div>
                                </div>
                                <div class="node-stats">
                                    <dl class="pairs pairs--rows">
                                        <dt>Chủ đề</dt>
                                        <dd>69</dd>
                                    </dl>
                                    <dl class="pairs pairs--rows">
                                        <dt>Bài viết</dt>
                                        <dd>178</dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="communicate-node">
                                <div class="communicate-image">
                                    <img src="./icon/27.png" alt="">
                                </div>
                                <div class="communicate-main">
                                    <div class="node-title"><a href="#" class="course-tieude">Hỏi Đáp</a></div>
                                    <div class="node-meta">
                                        <div class="node-statsMeta">
                                            <dl class="pairs pairs--inline">
                                                <dt><i class="fa--xf far fa-comment" aria-hidden="true"></i></dt>
                                                <dd>69</dd>
                                            </dl>
                                            <dl class="pairs pairs--inline">
                                                <dt><i class="fa--xf far fa-comments" aria-hidden="true"></i></dt>
                                                <dd>178</dd>
                                            </dl>
                                        </div>
                                    </div>
                                </div>
                                <div class="node-stats">
                                    <dl class="pairs pairs--rows">
                                        <dt>Chủ đề</dt>
                                        <dd>69</dd>
                                    </dl>
                                    <dl class="pairs pairs--rows">
                                        <dt>Bài viết</dt>
                                        <dd>178</dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="communicate-node">
                                <div class="communicate-image">
                                    <img src="./icon/5.png" alt="">
                                </div>
                                <div class="communicate-main">
                                    <div class="node-title"><a href="#" class="course-tieude">Tin Tức</a></div>
                                    <div class="node-meta">
                                        <div class="node-statsMeta">
                                            <dl class="pairs pairs--inline">
                                                <dt><i class="fa--xf far fa-comment" aria-hidden="true"></i></dt>
                                                <dd>69</dd>
                                            </dl>
                                            <dl class="pairs pairs--inline">
                                                <dt><i class="fa--xf far fa-comments" aria-hidden="true"></i></dt>
                                                <dd>178</dd>
                                            </dl>
                                        </div>
                                    </div>
                                </div>
                                <div class="node-stats">
                                    <dl class="pairs pairs--rows">
                                        <dt>Chủ đề</dt>
                                        <dd>69</dd>
                                    </dl>
                                    <dl class="pairs pairs--rows">
                                        <dt>Bài viết</dt>
                                        <dd>178</dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="communicate-node">
                                <div class="communicate-image">
                                    <img src="./icon/11.png" alt="">
                                </div>
                                <div class="communicate-main">
                                    <div class="node-title"><a href="#" class="course-tieude">Góp Ý</a></div>
                                    <div class="node-meta">
                                        <div class="node-statsMeta">
                                            <dl class="pairs pairs--inline">
                                                <dt><i class="fa--xf far fa-comment" aria-hidden="true"></i></dt>
                                                <dd>69</dd>
                                            </dl>
                                            <dl class="pairs pairs--inline">
                                                <dt><i class="fa--xf far fa-comments" aria-hidden="true"></i></dt>
                                                <dd>178</dd>
                                            </dl>
                                        </div>
                                    </div>
                                </div>
                                <div class="node-stats">
                                    <dl class="pairs pairs--rows">
                                        <dt>Chủ đề</dt>
                                        <dd>69</dd>
                                    </dl>
                                    <dl class="pairs pairs--rows">
                                        <dt>Bài viết</dt>
                                        <dd>178</dd>
                                    </dl>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9">
                <div>
                    <h5 style="margin: 30px 0 20px 30px">TÀI LIỆU CÁC MÔN HỌC</h5>
                </div>
                <div class="block-container">
                    <div class="uix_block-body--outer ">
                        <div class="communicate-list">
                            <div class="communicate-node">
                                <div class="communicate-image">
                                    <img src="./icon/s1.png" alt="">
                                </div>
                                <div class="communicate-main">
                                    <div class="node-title" style="margin-bottom: 10px;"><a href="#"
                                                                                            class="course-tieude">Kì 1</a></div>
                                    <div class="course-tailieu">
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAE101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">PRF192</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">CEA201</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">CSI104</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">SSL101c</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ENM301</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MKT101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MGT103</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ECO111</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">JDP106</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ENM301</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAD101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">SSG104</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ACC101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAC102</a></div>
                                    </div>
                                </div>
                                <div class="node-stats-2">
                                    <dl class="pairs pairs--rows">
                                        <dt>Chủ đề</dt>
                                        <dd>69</dd>
                                    </dl>
                                    <dl class="pairs pairs--rows">
                                        <dt>Bài viết</dt>
                                        <dd>178</dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="communicate-node">
                                <div class="communicate-image">
                                    <img src="./icon/s2.png" alt="">
                                </div>
                                <div class="communicate-main">
                                    <div class="node-title" style="margin-bottom: 10px;"><a href="#"
                                                                                            class="course-tieude">Kì 2</a></div>
                                    <div class="course-tailieu">
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAE101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">PRF192</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">CEA201</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">CSI104</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">SSL101c</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ENM301</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MKT101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MGT103</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ECO111</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">JDP106</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ENM301</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAD101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">SSG104</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ACC101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAC102</a></div>
                                    </div>
                                </div>
                                <div class="node-stats-2">
                                    <dl class="pairs pairs--rows">
                                        <dt>Chủ đề</dt>
                                        <dd>69</dd>
                                    </dl>
                                    <dl class="pairs pairs--rows">
                                        <dt>Bài viết</dt>
                                        <dd>178</dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="communicate-node">
                                <div class="communicate-image">
                                    <img src="./icon/s3.png" alt="">
                                </div>
                                <div class="communicate-main">
                                    <div class="node-title" style="margin-bottom: 10px;"><a href="#"
                                                                                            class="course-tieude">Kì 3</a></div>
                                    <div class="course-tailieu">
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAE101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">PRF192</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">CEA201</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">CSI104</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">SSL101c</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ENM301</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MKT101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MGT103</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ECO111</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">JDP106</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ENM301</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAD101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">SSG104</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ACC101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAC102</a></div>
                                    </div>
                                </div>
                                <div class="node-stats-2">
                                    <dl class="pairs pairs--rows">
                                        <dt>Chủ đề</dt>
                                        <dd>69</dd>
                                    </dl>
                                    <dl class="pairs pairs--rows">
                                        <dt>Bài viết</dt>
                                        <dd>178</dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="communicate-node">
                                <div class="communicate-image">
                                    <img src="./icon/s4.png" alt="">
                                </div>
                                <div class="communicate-main">
                                    <div class="node-title" style="margin-bottom: 10px;"><a href="#"
                                                                                            class="course-tieude">Kì 4</a></div>
                                    <div class="course-tailieu">
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAE101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">PRF192</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">CEA201</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">CSI104</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">SSL101c</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ENM301</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MKT101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MGT103</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ECO111</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">JDP106</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ENM301</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAD101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">SSG104</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ACC101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAC102</a></div>
                                    </div>
                                </div>
                                <div class="node-stats-2">
                                    <dl class="pairs pairs--rows">
                                        <dt>Chủ đề</dt>
                                        <dd>69</dd>
                                    </dl>
                                    <dl class="pairs pairs--rows">
                                        <dt>Bài viết</dt>
                                        <dd>178</dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="communicate-node">
                                <div class="communicate-image">
                                    <img src="./icon/s5.png" alt="">
                                </div>
                                <div class="communicate-main">
                                    <div class="node-title" style="margin-bottom: 10px;"><a href="#"
                                                                                            class="course-tieude">Kì 5</a></div>
                                    <div class="course-tailieu">
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAE101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">PRF192</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">CEA201</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">CSI104</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">SSL101c</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ENM301</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MKT101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MGT103</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ECO111</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">JDP106</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ENM301</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAD101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">SSG104</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ACC101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAC102</a></div>
                                    </div>
                                </div>
                                <div class="node-stats-2">
                                    <dl class="pairs pairs--rows">
                                        <dt>Chủ đề</dt>
                                        <dd>69</dd>
                                    </dl>
                                    <dl class="pairs pairs--rows">
                                        <dt>Bài viết</dt>
                                        <dd>178</dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="communicate-node">
                                <div class="communicate-image">
                                    <img src="./icon/s6.png" alt="">
                                </div>
                                <div class="communicate-main">
                                    <div class="node-title" style="margin-bottom: 10px;"><a href="#"
                                                                                            class="course-tieude">Kì 6</a></div>
                                    <div class="course-tailieu">
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAE101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">PRF192</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">CEA201</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">CSI104</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">SSL101c</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ENM301</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MKT101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MGT103</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ECO111</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">JDP106</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ENM301</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAD101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">SSG104</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ACC101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAC102</a></div>
                                    </div>
                                </div>
                                <div class="node-stats-2">
                                    <dl class="pairs pairs--rows">
                                        <dt>Chủ đề</dt>
                                        <dd>69</dd>
                                    </dl>
                                    <dl class="pairs pairs--rows">
                                        <dt>Bài viết</dt>
                                        <dd>178</dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="communicate-node">
                                <div class="communicate-image">
                                    <img src="./icon/s7.png" alt="">
                                </div>
                                <div class="communicate-main">
                                    <div class="node-title" style="margin-bottom: 10px;"><a href="#"
                                                                                            class="course-tieude">Kì 7</a></div>
                                    <div class="course-tailieu">
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAE101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">PRF192</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">CEA201</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">CSI104</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">SSL101c</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ENM301</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MKT101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MGT103</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ECO111</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">JDP106</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ENM301</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAD101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">SSG104</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ACC101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAC102</a></div>
                                    </div>
                                </div>
                                <div class="node-stats-2">
                                    <dl class="pairs pairs--rows">
                                        <dt>Chủ đề</dt>
                                        <dd>69</dd>
                                    </dl>
                                    <dl class="pairs pairs--rows">
                                        <dt>Bài viết</dt>
                                        <dd>178</dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="communicate-node">
                                <div class="communicate-image">
                                    <img src="./icon/s8.png" alt="">
                                </div>
                                <div class="communicate-main">
                                    <div class="node-title" style="margin-bottom: 10px;"><a href="#"
                                                                                            class="course-tieude">Kì 8</a></div>
                                    <div class="course-tailieu">
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAE101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">PRF192</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">CEA201</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">CSI104</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">SSL101c</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ENM301</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MKT101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MGT103</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ECO111</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">JDP106</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ENM301</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAD101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">SSG104</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ACC101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAC102</a></div>
                                    </div>
                                </div>
                                <div class="node-stats-2">
                                    <dl class="pairs pairs--rows">
                                        <dt>Chủ đề</dt>
                                        <dd>69</dd>
                                    </dl>
                                    <dl class="pairs pairs--rows">
                                        <dt>Bài viết</dt>
                                        <dd>178</dd>
                                    </dl>
                                </div>
                            </div>
                            <div class="communicate-node">
                                <div class="communicate-image">
                                    <img src="./icon/s9.png" alt="">
                                </div>
                                <div class="communicate-main">
                                    <div class="node-title" style="margin-bottom: 10px;"><a href="#"
                                                                                            class="course-tieude">Kì 9</a></div>
                                    <div class="course-tailieu">
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAE101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">PRF192</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">CEA201</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">CSI104</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">SSL101c</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ENM301</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MKT101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MGT103</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ECO111</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">JDP106</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ENM301</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAD101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">SSG104</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">ACC101</a></div>
                                        <div><i class="fa--xf far fa-comments" aria-hidden="true"></i><a
                                                href="">MAC102</a></div>
                                    </div>
                                </div>
                                <div class="node-stats-2">
                                    <dl class="pairs pairs--rows">
                                        <dt>Chủ đề</dt>
                                        <dd>69</dd>
                                    </dl>
                                    <dl class="pairs pairs--rows">
                                        <dt>Bài viết</dt>
                                        <dd>178</dd>
                                    </dl>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <nav>
                    <ul class="pagination justify-content-center">
                        <li class="page-item active disabled"> <span class="page-link">1</span></li>
                        <li class="page-item"><a href="#" data-ci-pagination-page="2">2</a></li>
                        <li class="page-item"><a href="#" data-ci-pagination-page="2" rel="next"><i
                                class="fas fa-chevron-right"></i></a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</section>

<jsp:include page="./components/footer.jsp"/>
<script src="js/script.js"></script>
</body>

</html>
