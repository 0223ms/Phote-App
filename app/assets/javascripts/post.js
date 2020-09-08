$(document).on('turbolinks:load', function() {
  $(function() {
    $(".option-btn-post").on('click', function(){
      var content = $(this).next(".gray-back");
      content.fadeIn("show");
      var contentMenu = content.children(".option-menu");
      contentMenu.fadeIn("show");
    })

    $('.slick').slick({
      dots:true,
      prevArrow: '<button class="slide-arrow prev-arrow"></button>',
      nextArrow: '<button class="slide-arrow next-arrow"></button>'
    });
  });
});