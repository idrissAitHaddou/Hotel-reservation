
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
                                <span class="info-color">Suites</span>
                                <span id="suitesCount" class="info-bold"></span>
                            </div>
                            <div class="followers info-flex">
                                <span class="info-color">Rooms</span>
                                <span id="roomsCount" class="info-bold"></span>
                            </div>
                            <div class="following info-flex">
                                <span class="info-color">Bookings</span>
                                <span id="bookingsCount" class="info-bold"></span>
                            </div>
                        </div>
                    </div>
                    <div class="profile-body">
                        <span id="fullname" class="body-name"></span>
                        <span id="email" class="body-job"></span>
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
        <div class="right-components mt-3 md:w-3/5">
            <div class="chart">
                <div class="container-chart">
                    <div class="left-part">
                        <span class="font-extrabold">Type Rooms</span>
                        <div class="lists">
                            <div class="list">
                                <div class="list-image">
                                    <img
                                            class="circle-image"
                                            src="https://i.postimg.cc/Z5QZ8c1f/Ellipse-6.png"
                                            alt="circle"
                                    />
                                </div>
                                <span>double</span>
                            </div>
                            <div class="list">
                                <div class="list-image">
                                    <img
                                            class="circle-image"
                                            src="https://i.postimg.cc/L6RzSkQ0/UX-Design.png"
                                            alt="circle"
                                    />
                                </div>
                                <span>triple</span>
                            </div>
                            <div class="list">
                                <div class="list-image">
                                    <img
                                            class="circle-image"
                                            src="https://i.postimg.cc/qBc31hBc/Ellipse-7.png"
                                            alt="circle"
                                    />
                                </div>
                                <span>individuelle</span>
                            </div>
                            <div class="list">
                                <div class="list-image">
                                    <img
                                            class="circle-image"
                                            src="https://i.postimg.cc/t4nRmwt0/Ellipse-7-1.png"
                                            alt="circle"
                                    />
                                </div>
                                <span>suite</span>
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





