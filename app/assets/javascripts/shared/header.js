$(document).on('turbolinks:load', function() {
  $(function(){
    $(document).on("click", function(e){
      if( e.which === 1 && e.target === $(".header-users i").get(0) ){
        $(".header-users-notification").fadeIn("1000");
      }else{
        $(".header-users-notification").fadeOut("1000");
      }
    });

    $(document).on("click", function(e){
      if( e.which === 1 && e.target === $(".header-like i").get(0) ){
        $(".header-like-notification").fadeIn("1000");
      }else{
        $(".header-like-notification").fadeOut("1000");
      }
    });

    $(".notification-list-link").on("click", function(e){
      e.preventDefault();
      let linkUrl = $(this).attr('href');
      $(".header-users-notification").fadeOut("0");
      function action() {
        location.href = linkUrl;
      }
      setTimeout(action,300);
    });
  });
});
