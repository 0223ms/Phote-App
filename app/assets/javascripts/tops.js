$(document).on('turbolinks:load', function() {
  $(function(){
    $(".follow-cancel-btn-top").on("click", function(){
      $(".back-screen").fadeIn("show");
      $(".follow-cancel-window").fadeIn("show");
    })
    $(".back-screen").on("click", function(){
      $(".back-screen").fadeOut("show");
      $(".follow-cancel-window").fadeOut("show")
    })
    $(".cancel-window").on("click", function(){
      $(".back-screen").fadeOut("show");
      $(".follow-cancel-window").fadeOut("show");
    })
  });
});