//페이지 전체 a효과 막기
$("a").click(function () {
  return true;
});
//form
function Header_init() {
  //'헤더-전체 카테고리 보기' 클릭하면 카테고리 팝업이 나옴
  $(".btn-category").click(function () {
    if ($(".popup-category").hasClass("active")) {
      $(".popup-category").removeClass("active");
      $("html").removeClass("active");
    } else {
      $(".popup-category").addClass("active");
      $("html").addClass("active");
    }
  });
  $(".popup-category .btn-close").click(function () {
    $(".popup-category").removeClass("active");
    $("html").removeClass("active");
  });
}

function Topbar_init() {
  //스크롤을 내리면 고정탑바가 맨 위에 고정됨
  $(window).scroll(function () {
    let scroll_top = $(this).scrollTop();

    // console.log(scroll_top);

    if (scroll_top > 194) {
      $(".top-bar").addClass("active");
    } else {
      $(".top-bar").removeClass("active");
    }
  });

  //'고정탑바-검색버튼'을 누르면 검색 팝업이 나옴
  $(".btn-search-topbar").click(function () {
    if ($(".top-bar > .popup-search").hasClass("active")) {
      $(".top-bar > .popup-search").removeClass("active");
    } else {
      $(".top-bar > .popup-search").addClass("active");
    }
  });
  $(".top-bar > .popup-search .btn-close").click(function () {
    $(".top-bar > .popup-search").removeClass("active");
  });
}

function Topbar_scroll_0() {
  //'탑바-알라딘 추천 도서' 클릭하면 '추천도서' 위치로 이동
  $(".top-bar .btn-sec-0 > a").click(function () {
    $("html, body").animate({
        scrollTop: 0
      },
      500
    );
    return false;
  });
}

function Topbar_scroll_1() {
  //'탑바-알라딘 추천 도서' 클릭하면 '추천도서' 위치로 이동
  $(".top-bar .btn-sec-1 > a").click(function () {
    $("html, body").animate({
        scrollTop: 199
      },
      500
    );
    return false;
  });
}
//button
function Topbar_scroll_2() {
  //'탑바-알라딘 추천 음반' 클릭하면 '추천음반' 위치로 이동
  $(".top-bar .btn-sec-2 > a").click(function () {
    $("html, body").animate({
        scrollTop: 2110
      },
      500
    );
    return false;
  });
}

function Topbar_scroll_3() {
  //'탑바-이 달의 이벤트' 클릭하면 '이벤트' 위치로 이동
  $(".top-bar .btn-sec-3 > a").click(function () {
    $("html, body").animate({
        scrollTop: 2833
      },
      500
    );
    return false;
  });
}

function Topbar_scroll_4() {
  //'탑바-중고매장' 클릭하면 '이벤트' 위치로 이동
  $(".top-bar .btn-sec-4 > a").click(function () {
    $("html, body").animate({
        scrollTop: 3766
      },
      500
    );
    return false;
  });
}

$(".header_mobile-bar").click(function () {
  if ($(".header_mobile-menu").hasClass("active")) {
    $(".header_mobile-menu").removeClass("active");
    $("html").removeClass("active");
  } else {
    $(".header_mobile-menu").addClass("active");
    $("html").addClass("active");
  }
});

function SectionSlide_init() {
  //'메인 슬라이드'
  const swiper_main_slide = new Swiper(".swiper-main-slide", {
    loop: true,
    slidesPerView: 1,
    spaceBetween: 10,
    effect: "fade",

    autoplay: {
      delay: 5000,
      disableOnInteraction: true
    },

    on: {
      slideChange: function () {
        $(".slide-title > ul > li").removeClass("active");
        $(".slide-title > ul > li").eq(this.realIndex).addClass("active");
      }
    }
  });

  //'메인 슬라이드' 목록 클릭하는대로 슬라이드 이동
  $(".slide-title > ul > li:first-child").click(function () {
    swiper_main_slide.slideTo(1, 1000, false);
  });
  $(".slide-title > ul > li:nth-child(2)").click(function () {
    swiper_main_slide.slideTo(2, 1000, false);
  });
  $(".slide-title > ul > li:nth-child(3)").click(function () {
    swiper_main_slide.slideTo(3, 1000, false);
  });
  $(".slide-title > ul > li:nth-child(4)").click(function () {
    swiper_main_slide.slideTo(4, 1000, false);
  });
}

function SectionRecom_init() {
  //'추천 마법사' 슬라이드
  const swiper_recom = new Swiper(".swiper-recom", {
    loop: false,

    autoplay: {
      delay: 5000,
      disableOnInteraction: true
    },

    slidesPerView: 4, //640~1024 해상도 외 레이아웃 뷰 개수
    spaceBetween: 20, //위 slidesPerview 여백

    slidesPerGroup: 4,

    navigation: {
      nextEl: ".swiper-recom .swiper-button-next",
      prevEl: ".swiper-recom .swiper-button-prev"
    },

    breakpoints: {
      //반응형 조건 속성
      300: {
        slidesPerView: 1,
        slidesPerGroup: 1
      },
      520: {
        slidesPerView: 2,
        slidesPerGroup: 2
      },
      768: {
        slidesPerView: 3,
        slidesPerGroup: 3
      },
      1024: {
        slidesPerView: 4,
        slidesPerGroup: 4
      }
    }
  });
}

function SectionToday_init() {
  //'오늘의 한 문장' 책 클릭하면 해당 내용으로 변함
  $(
    ".section-today > div > .inner > .book-box > .book-img-box > .book-right"
  ).click(function () {
    //오른쪽과 센터가 바뀐 상태
    if (
      $(".section-today > div > .inner > .book-main > .book-right").hasClass(
        "active"
      )
    ) {
      $(".section-today > div > .inner > .book-main > .text-box").removeClass(
        "active"
      );
      $(".section-today > div > .inner > .book-main > .book-center").addClass(
        "active"
      );

      //이미지 바꾸기(원상복구)
      var centerImg = document.getElementById("book-img-center");
      centerImg.setAttribute(
        "src",
        "https://image.aladin.co.kr/product/29246/9/cover500/8932922055_1.jpg"
      );
      var rightImg = document.getElementById("book-img-right");
      rightImg.setAttribute(
        "src",
        "https://image.aladin.co.kr/product/29231/77/cover500/k252837196_1.jpg"
      );

      //이미지 텍스트 바꾸기(원상복구)
      $(
        ".section-today > div > .inner > .book-box > .book-img-box > .book-right .book-title"
      ).html("더러운 손을 거기에 닦지 마");
      $(
        ".section-today > div > .inner > .book-box > .book-img-box > .book-right .book-writer"
      ).html("아시자와 요 지음");

      //메인 색상 바꾸기(원상복구)
      $(".section-today > .today-bg").css("background-color", "#018B7B");
      $(".section-today > div > .inner > .book-main > .text-box > *").css(
        "color",
        "#fff"
      );
    }
    //초기 상태
    else {
      $(".section-today > div > .inner > .book-main > .text-box").removeClass(
        "active"
      );
      $(".section-today > div > .inner > .book-main > .book-right").addClass(
        "active"
      );

      //이미지 바꾸기
      var centerImg = document.getElementById("book-img-center");
      centerImg.setAttribute(
        "src",
        "https://image.aladin.co.kr/product/29231/77/cover500/k252837196_1.jpg"
      );
      var rightImg = document.getElementById("book-img-right");
      rightImg.setAttribute(
        "src",
        "https://image.aladin.co.kr/product/29246/9/cover500/8932922055_1.jpg"
      );

      //이미지 텍스트 바꾸기
      $(
        ".section-today > div > .inner > .book-box > .book-img-box > .book-right .book-title"
      ).html("미래가 우리 손을 떠나기 전에");
      $(
        ".section-today > div > .inner > .book-box > .book-img-box > .book-right .book-writer"
      ).html("나오미 클라인,리베카 스테포프 지음");

      //메인 색상 바꾸기
      // $(".section-today > .today-bg").css("background-color", "#75B8BE");
      $(".section-today > .today-bg").css("background-color", "#B9AFA5");
      $(".section-today > div > .inner > .book-main > .text-box > *").css(
        "color",
        "#333"
      );
    }
  });
}

function SectionRecords_init() {
  //'추천 음반' 슬라이드
  const swiper_records = new Swiper(".swiper-records", {
    loop: true,
    slidesPerView: 1,
    spaceBetween: 10,

    autoplay: {
      delay: 5000,
      disableOnInteraction: true
    },

    on: {
      slideChange: function () {
        $(".section-records .title ul > li").removeClass("active");
        $(".section-records .title ul > li")
          .eq(this.realIndex)
          .addClass("active");
      }
    }
  });

  //'추천 음반' 목록 클릭하는대로 슬라이드 이동
  $(".section-records .title ul > li:first-child > a").click(function () {
    swiper_records.slideTo(1, 1000, false);
  });
  $(".section-records .title ul > li:nth-child(2) > a").click(function () {
    swiper_records.slideTo(2, 1000, false);
  });
  $(".section-records .title ul > li:nth-child(3) > a").click(function () {
    swiper_records.slideTo(3, 1000, false);
  });
}

function SectionEvent_init() {
  //'이벤트 슬라이드'
  const swiper_event = new Swiper(".swiper-event", {
    loop: true,
    slidesPerView: 1,
    spaceBetween: 10,
    effect: "fade",

    autoplay: {
      delay: 5000,
      disableOnInteraction: true
    },

    on: {
      slideChange: function () {
        $(".section-event .sub-title > ul > li").removeClass("active");
        $(".section-event .sub-title > ul > li")
          .eq(this.realIndex)
          .addClass("active");
      }
    }
  });

  //'이벤트 슬라이드' 목록 클릭하는대로 슬라이드 이동
  $(".section-event .sub-title > ul > li:first-child > a").click(function () {
    swiper_event.slideTo(1, 1000, false);
  });
  $(".section-event .sub-title > ul > li:nth-child(2) > a").click(function () {
    swiper_event.slideTo(2, 1000, false);
  });
  $(".section-event .sub-title > ul > li:nth-child(3) > a").click(function () {
    swiper_event.slideTo(3, 1000, false);
  });
  $(".section-event .sub-title > ul > li:nth-child(4) > a").click(function () {
    swiper_event.slideTo(4, 1000, false);
  });
  $(".section-event .sub-title > ul > li:nth-child(5) > a").click(function () {
    swiper_event.slideTo(5, 1000, false);
  });
  $(".section-event .sub-title > ul > li:nth-child(6) > a").click(function () {
    swiper_event.slideTo(6, 1000, false);
  });
  $(".section-event .sub-title > ul > li:nth-child(7) > a").click(function () {
    swiper_event.slideTo(7, 1000, false);
  });
  $(".section-event .sub-title > ul > li:nth-child(8) > a").click(function () {
    swiper_event.slideTo(8, 1000, false);
  });
}

function SectionUsed_init() {
  //'중고' 슬라이드
  const swiper_used = new Swiper(".swiper-used", {
    loop: true,
    slidesPerView: 1,
    spaceBetween: 10,

    // autoplay: {
    //   delay: 5000,
    //   disableOnInteraction: true
    // },

    on: {
      slideChange: function () {
        $(".section-used .title ul > li").removeClass("active");
        $(".section-used .title ul > li").eq(this.realIndex).addClass("active");
      }
    }
  });

  //'중고' 목록 클릭하는대로 슬라이드 이동
  $(".section-used .title ul > li:first-child > a").click(function () {
    swiper_used.slideTo(1, 1000, false);
  });
  $(".section-used .title ul > li:nth-child(2) > a").click(function () {
    swiper_used.slideTo(2, 1000, false);
  });

  //지도에서 클릭하는대로 목록 진하게 표시
  //seoul
  $(".map-contents .map-box .point-box > .seoul").click(function () {
    if ($(".map-contents .list-box > .list-box-1 > li").hasClass("active")) {
      $(".map-contents .list-box > ul > li").removeClass("active");
    } else {
      $(".map-contents .list-box > ul > li").removeClass("active");
      $(".map-contents .list-box > .list-box-1 > li").addClass("active");
    }
  });
  //gyeonggi
  $(".map-contents .map-box .point-box > .gyeonggi").click(function () {
    if ($(".map-contents .list-box > .list-box-2 > li").hasClass("active")) {
      $(".map-contents .list-box > ul > li").removeClass("active");
    } else {
      $(".map-contents .list-box > ul > li").removeClass("active");
      $(".map-contents .list-box > .list-box-2 > li").addClass("active");
    }
  });
  //incheon
  $(".map-contents .map-box .point-box > .incheon").click(function () {
    if (
      $(".map-contents .list-box > .list-box-3 > .incheon").hasClass("active")
    ) {
      $(".map-contents .list-box > ul > li").removeClass("active");
    } else {
      $(".map-contents .list-box > ul > li").removeClass("active");
      $(".map-contents .list-box > .list-box-3 > .incheon").addClass("active");
    }
  });
  //daejeon
  $(".map-contents .map-box .point-box > .daejeon").click(function () {
    if (
      $(".map-contents .list-box > .list-box-3 > .daejeon").hasClass("active")
    ) {
      $(".map-contents .list-box > ul > li").removeClass("active");
    } else {
      $(".map-contents .list-box > ul > li").removeClass("active");
      $(".map-contents .list-box > .list-box-3 > .daejeon").addClass("active");
    }
  });
  //jeonbuk
  $(".map-contents .map-box .point-box > .jeonbuk").click(function () {
    if (
      $(".map-contents .list-box > .list-box-3 > .jeonbuk").hasClass("active")
    ) {
      $(".map-contents .list-box > ul > li").removeClass("active");
    } else {
      $(".map-contents .list-box > ul > li").removeClass("active");
      $(".map-contents .list-box > .list-box-3 > .jeonbuk").addClass("active");
    }
  });
  //daegu
  $(".map-contents .map-box .point-box > .daegu").click(function () {
    if (
      $(".map-contents .list-box > .list-box-3 > .daegu").hasClass("active")
    ) {
      $(".map-contents .list-box > ul > li").removeClass("active");
    } else {
      $(".map-contents .list-box > ul > li").removeClass("active");
      $(".map-contents .list-box > .list-box-3 > .daegu").addClass("active");
    }
  });
  //ulsan
  $(".map-contents .map-box .point-box > .ulsan").click(function () {
    if (
      $(".map-contents .list-box > .list-box-3 > .ulsan").hasClass("active")
    ) {
      $(".map-contents .list-box > ul > li").removeClass("active");
    } else {
      $(".map-contents .list-box > ul > li").removeClass("active");
      $(".map-contents .list-box > .list-box-3 > .ulsan").addClass("active");
    }
  });
  //gwangju
  $(".map-contents .map-box .point-box > .gwangju").click(function () {
    if (
      $(".map-contents .list-box > .list-box-3 > .gwangju").hasClass("active")
    ) {
      $(".map-contents .list-box > ul > li").removeClass("active");
    } else {
      $(".map-contents .list-box > ul > li").removeClass("active");
      $(".map-contents .list-box > .list-box-3 > .gwangju").addClass("active");
    }
  });
  //gyeongnam
  $(".map-contents .map-box .point-box > .gyeongnam").click(function () {
    if (
      $(".map-contents .list-box > .list-box-3 > .gyeongnam").hasClass("active")
    ) {
      $(".map-contents .list-box > ul > li").removeClass("active");
    } else {
      $(".map-contents .list-box > ul > li").removeClass("active");
      $(".map-contents .list-box > .list-box-3 > .gyeongnam").addClass(
        "active"
      );
    }
  });
  //busan
  $(".map-contents .map-box .point-box > .busan").click(function () {
    if (
      $(".map-contents .list-box > .list-box-3 > .busan").hasClass("active")
    ) {
      $(".map-contents .list-box > ul > li").removeClass("active");
    } else {
      $(".map-contents .list-box > ul > li").removeClass("active");
      $(".map-contents .list-box > .list-box-3 > .busan").addClass("active");
    }
  });
}

function FooterNotice_init() {
  //'추천 마법사' 슬라이드
  const swiper_notice = new Swiper(".swiper-notice", {
    loop: true,
    direction: "vertical",
    slidesPerView: 1,
    spaceBetween: 0,

    autoplay: {
      delay: 5000,
      disableOnInteraction: true
    },

    navigation: {
      nextEl: ".swiper-notice .swiper-button-next",
      prevEl: ".swiper-notice .swiper-button-prev"
    }
  });
}
//form
function BtnToTop_init() {
  $(window).scroll(function () {
    let scroll_top = $(this).scrollTop();

    if (scroll_top > 240) {
      $(".btn-to-top").addClass("active");
    } else {
      $(".btn-to-top").removeClass("active");
    }
  });

  $(".btn-to-top").click(function () {
    $("html, body").animate({
        scrollTop: 0
      },
      500
    );
    return false;
  });
}
Header_init();
Topbar_init();
Topbar_scroll_0();
Topbar_scroll_1();
Topbar_scroll_2();
Topbar_scroll_3();
Topbar_scroll_4();
SectionSlide_init();
SectionRecom_init();
SectionToday_init();
SectionRecords_init();
SectionEvent_init();
SectionUsed_init();
FooterNotice_init();
BtnToTop_init();