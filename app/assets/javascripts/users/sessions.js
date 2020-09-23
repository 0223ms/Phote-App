$(document).on('turbolinks:load', function() {
  $(function(){
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
    var wsize = $(window).width();
    var hsize = $(window).height();
    if ( hsize <= 700 || wsize <= 1020 ){
      $(".signIn-inner__text").css('display', 'none');
    } else {
      $(".signIn-inner__text").css('display', 'block');
    }
    if ( hsize <= 600 ){
      $(".footer").css('display', 'none');
      $(".signIn-background").css('height', '100vh')
      $(".signIn-inner").css('overflow', 'auto');
    } else {
      $(".footer").css('display', 'block');
      $(".signIn-background").css('height', 'calc(100vh - 100px)');
      $(".signIn-inner").css('overflow', '');
    }
    $(window).resize(function(){
      var wsize = $(window).width();
      var hsize = $(window).height();
      if ( hsize <= 700 || wsize <= 1020 ){
        $(".signIn-inner__text").css('display', 'none');
      } else {
        $(".signIn-inner__text").css('display', 'block');
      }
      if ( hsize <= 600 ){
        $(".footer").css('display', 'none');
        $(".signIn-background").css('height', '100vh');
        $(".signIn-inner").css('overflow', 'auto');
      } else {
        $(".footer").css('display', 'block');
        $(".signIn-background").css('height', 'calc(100vh - 100px)');
        $(".signIn-inner").css('overflow', '');
      }
    })
  });
});
