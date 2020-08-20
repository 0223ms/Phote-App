$(document).on('turbolinks:load', function(){
  $(function(){
    $(".option-btn-post").on("click", function(){
      $(".gray-back").fadeIn("show");
      $(".option-menu").fadeIn("show");
    })
  });
});



