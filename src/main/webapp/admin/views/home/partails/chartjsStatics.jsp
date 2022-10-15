<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap"
            rel="stylesheet"
    />
</head>
<body>
    <div class="wrapper w-full flex flex-col md:flex-row justify-between item-center p-6">
        <!-- left-start -->
        <div class="left-components">
            <div class="profile">
                <div class="container">
                    <div class="profile-header">
                        <div class="profile-image">
                            <img
                                    src="https://i.postimg.cc/DwNcgkC9/Profile-Image.png"
                                    alt="profile-photo"
                            />
                        </div>
                        <div class="profile-info">
                            <div class="post info-flex">
                                <span class="info-color">Post</span>
                                <span class="info-bold">23</span>
                            </div>
                            <div class="followers info-flex">
                                <span class="info-color">Followers</span>
                                <span class="info-bold">326</span>
                            </div>
                            <div class="following info-flex">
                                <span class="info-color">Following</span>
                                <span class="info-bold">120</span>
                            </div>
                        </div>
                    </div>
                    <div class="profile-body">
                        <span class="body-name">Neelesh Chaudhary</span>
                        <span class="body-job">UI / UX Designer</span>
                    </div>
                    <div class="profile-footer">
                        <span class="profile-footer__bold">About</span>
                        <p class="profile-footer__p">
                            Eager and passionate user experience designer with a background
                            in graphic design, web design and digital marketing. Looking for
                            next...
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <!-- left-end -->
        <!-- right-start -->
        <div class="right-components mt-3">
            <div class="chart">
                <div class="container-chart">
                    <div class="left-part">
                        <span class="ex-bold">Expertise</span>
                        <div class="lists">
                            <div class="list">
                                <div class="list-image">
                                    <img
                                            class="circle-image"
                                            src="https://i.postimg.cc/Z5QZ8c1f/Ellipse-6.png"
                                            alt="circle"
                                    />
                                </div>
                                <span>UI Design</span>
                            </div>
                            <div class="list">
                                <div class="list-image">
                                    <img
                                            class="circle-image"
                                            src="https://i.postimg.cc/L6RzSkQ0/UX-Design.png"
                                            alt="circle"
                                    />
                                </div>
                                <span>UX Research</span>
                            </div>
                            <div class="list">
                                <div class="list-image">
                                    <img
                                            class="circle-image"
                                            src="https://i.postimg.cc/qBc31hBc/Ellipse-7.png"
                                            alt="circle"
                                    />
                                </div>
                                <span>Design Interaction</span>
                            </div>
                            <div class="list">
                                <div class="list-image">
                                    <img
                                            class="circle-image"
                                            src="https://i.postimg.cc/t4nRmwt0/Ellipse-7-1.png"
                                            alt="circle"
                                    />
                                </div>
                                <span>Wireframing</span>
                            </div>
                        </div>
                    </div>
                    <div class="right-part">
                        <canvas
                                class="pie-rotate"
                                id="myChart"
                                style="width: 100%; max-width: 173px"
                        ></canvas>
                    </div>
                </div>
            </div>
        </div>
        <!-- right-end -->
    </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js"></script>
<script src="./app.js"></script>
</body>
</html>




