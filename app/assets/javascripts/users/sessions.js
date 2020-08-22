$(document).on('turbolinks:load', function() {
  $(function(){
    $(".btn-app").hover(
      function(){
        $(this).css('opacity', '0.5');
      },
      function(){
        $(this).css('opacity', '');
      }
    );
  
    $(".btn-google").hover(
      function(){
        $(this).css('opacity', '0.5');
      },
      function(){
        $(this).css('opacity', '');
      }
    );
  });  
});
