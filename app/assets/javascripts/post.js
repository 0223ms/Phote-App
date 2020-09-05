$(document).on('turbolinks:load', function() {
  $(function() {
    $(".option-btn-post").on('click', function(){
    console.log(this);
      var content = $(this).next(".gray-back");
      console.log(content);
      content.fadeIn("show");
      var contentMenu = content.children(".option-menu");
      console.log(contentMenu);
      contentMenu.fadeIn("show");
    })
  });
});