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

    $("#signIp-form-field-email, #signIp-form-field-password").on('keyup', function(){
      let email = $("#signIp-form-field-email");
      let password = $("#signIp-form-field-password");
      if(email.val() !== "" && password.val() !== "") {
        $(".signIp-form-submit").css('pointer-events', 'auto');
        $(".signIp-form-submit").css('background-color', '#02a1fd');
      } else {
        $(".signIp-form-submit").css('pointer-events', 'none');
        $(".signIp-form-submit").css('background-color', '#02a1fd9c');
      }
    })
  });  
});
