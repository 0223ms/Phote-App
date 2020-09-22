$(document).on('turbolinks:load', function() {
  $(function(){
    function addUser(user, image) {
      let html = `
      <a href="/exhibitions/${ user.id }"><div class="header-inner__search-lists__list">
      <div class="header-inner__search-lists__list">
        <div class="search-user-left">
          <img class="search-user-left__image" src="${ image }" width="30" height="30">
        </div>
        <div class="search-user-right">
          <div class="search-user-right__username">
            ${ user.username }
          </div>
          <div class="search-user-right__nickname">
            ${ user.nickname }
          </div>
        </div>
      </div>
      </a>
      `
      $(".header-inner__search-lists").append(html);
    }

    function addNoUser() {
      let html = `
      <div class="header-inner__search-lists__list">
        <div class="none-user">ユーザーが見つかりません</div>
      </div>
      `
      $(".header-inner__search-lists").append(html);
    }

    $(document).on("click", function(e){
      if( e.which === 1 && e.target === $(".header-users i").get(0) ){
        $(".header-users-notification").fadeIn("fast");
      }else{
        $(".header-users-notification").fadeOut("fast");
      }
    });

    $(document).on("click", function(e){
      if( e.which === 1 && e.target === $(".header-like i").get(0) ){
        $(".header-like-notification").fadeIn("fast");
        $(".header-like-notification-top").fadeIn("fast");
      }else{
        $(".header-like-notification").fadeOut("fast");
        $(".header-like-notification-top").fadeOut("fast");
      }
    });

    $(".notification-list-link").on("click", function(e){
      e.preventDefault();
      let linkUrl = $(this).attr('href');
      $(".header-users-notification").fadeOut("0");
      function action() {
        location.href = linkUrl;
      }
      setTimeout(action,100);
    });

    $(document).on("click", function(e){
      if( e.which === 1 && e.target === $("#header-search-id").get(0) ){
        $("#search-text-id").css('display', 'none');
        $("#header-inner__search__label-id").css('left', '10px');
      }else{
        $("#search-text-id").css('display', 'inline');
        $("#header-inner__search__label-id").css('left', '70px');
        $("#header-search-id").val("");
        $("#search-design").css('display', 'none');
        $(".header-inner__search-lists").css('display', 'none');
      }
    });

    $("#header-search-id").on('keyup', function(){
      let input = $(this).val();
      if(input !== "") {
        $("#search-design").css('display', 'inline');
        $(".header-inner__search-lists").css('display', 'inline');
      } else {
        $("#search-design").css('display', 'none');
        $(".header-inner__search-lists").css('display', 'none');
      }
      $.ajax({
        type: "GET",
        url: "/rooms/search",
        data: { keyword: input },
        dataType: "json"
      })
      .done(function(users) {
        $(".header-inner__search-lists").empty();
        if (users.length !== 0) {
          users.forEach(function(user) {
            if (user.image.url !== null){
              let imageUrl = user.image.url;
              addUser(user, imageUrl);
            } else {
              let imageUrl = "/assets/user1-f9546ff45901158469729a6ba7029ea0262bec7dd7b42dca28462d251664b162.png";
              addUser(user, imageUrl);
            }
          });
        } else if (input.length == 0) {
          return false;
        } else {
          addNoUser();
        }
      })
      .fail(function() {
        alert("通信エラーです。ユーザーが表示できません。");
      });
    });

    var startPos = 0,winScrollTop = 0;
    $(window).on('scroll',function(){
      winScrollTop = $(this).scrollTop();
      if (winScrollTop >= startPos) {
        if(winScrollTop >= 150){
          $('.header-box').addClass('hide');
        }
      } else {
        $('.header-box').removeClass('hide');
      }
      startPos = winScrollTop;
    });
  });
});
