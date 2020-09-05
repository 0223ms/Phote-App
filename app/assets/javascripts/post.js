$(document).on('turbolinks:load', function() {
  $(function() {
    $(".option-btn-post").on("click", function(){
      $(".gray-back").fadeIn("show");
      $(".option-menu").fadeIn("show");
    })
    
  // var val = $(".option-btn-top").attr('id')
  //   $(val).on("click", function() {
  //     console.log(this);
  //     $(".gray-back").fadeIn("show");
  //     $(".option-menu").fadeIn("show");
  //   })
  });
});


