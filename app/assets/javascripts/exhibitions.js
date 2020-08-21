$(document).on('turbolinks:load', function() {
  $(function(){
    $(".option-btn").on("click", function(){
      $(".gray-back").fadeIn("show");
      $(".option-menu").fadeIn("show");
    })
    $(".gray-back").on("click", function(){
      $(".gray-back").fadeOut("show");
      $(".option-menu").fadeOut("show");
      $(".follow-cancel-window").fadeOut("show")
    })
    $(".cancel-btn").on("click", function(){
      $(".gray-back").fadeOut("show");
      $(".option-menu").fadeOut("show");
    })
    $(".option-btn-other").on("click", function(){
      $(".gray-back").fadeIn("show");
      $(".option-menu").fadeIn("show");
    })
    $(".follow-cancel-btn").on("click", function(){
      $(".gray-back").fadeIn("show");
      $(".follow-cancel-window").fadeIn("show");
    })
    $(".cancel-window").on("click", function(){
      $(".gray-back").fadeOut("show");
      $(".follow-cancel-window").fadeOut("show");
    })
  });  
});
