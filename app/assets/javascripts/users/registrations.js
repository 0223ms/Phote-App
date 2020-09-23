$(document).on('turbolinks:load', function() {
  $(function(){
    function buildHTML(image){
      let html = `
                  <div class=".user-image-box">
                    <label for="image-edit-id">
                      <img src="${image}", class="user-image">
                    </label>
                  </div>
                  `
      console.log(html);
      return html;
    }
  
    $("#image-edit-id").on("change", function(){
      console.log("change");
      let file = this.files[0];
      // FileReader=>ユーザーのファイルをウェブアプリケーションから非同期的に読み込むことができるオブジェクト
      var reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function(){
      $(".user-image").remove();
        let image = this.result;
        var html = buildHTML(image);
        $(".user-image-box").append(html);
      }
    })

    $("#signUp-form-field-email, #signUp-form-field-nickname, #signUp-form-field-username, #signUp-form-password").on('keyup', function(){
      let email = $("#signUp-form-field-email");
      let nickname = $("#signUp-form-field-nickname");
      let username = $("#signUp-form-field-username");
      let password = $("#signUp-form-password");
      if(email.val() !== "" && nickname.val() !== "" && username.val() !== "" && password.val() !== "") {
        $(".signUp-form-submit").css('pointer-events', 'auto');
        $(".signUp-form-submit").css('background-color', '#02a1fd');
      } else {
        $(".signUp-form-submit").css('pointer-events', 'none');
        $(".signUp-form-submit").css('background-color', '#02a1fd9c');
      }
    })

    $("#password-form-current, #password-form-new, #password-form-confirmation").on('keyup', function(){
      let pass_current = $("#password-form-current");
      let pass_new = $("#password-form-new");
      let pass_confirmation = $("#password-form-confirmation");
      if(pass_current.val() !== "" && pass_new.val() !== "" && pass_confirmation.val() !== "") {
        $(".password-submit").css('pointer-events', 'auto');
        $(".password-submit").css('background-color', '#02a1fd');
      } else {
        $(".password-submit").css('pointer-events', 'none');
        $(".password-submit").css('background-color', '#02a1fd9c');
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
    } else {
      $(".footer").css('display', 'block');
      $(".signIn-background").css('height', 'calc(100vh - 100px)')
    }
    if ( hsize <= 700 ){
      $(".footer").css('display', 'none');
      $(".signUp-inner").css('overflow', 'auto');
    } else {
      $(".footer").css('display', 'block');
      $(".signUp-inner").css('overflow', 'nomal');
    }
    $(window).resize(function(){
      var wsize = $(window).width();
      var hsize = $(window).height();
      if ( hsize <= 700 || wsize <= 1020 ){
        $(".signUp-inner__text").css('display', 'none');
      } else {
        $(".signUp-inner__text").css('display', 'block');
      }
      if ( hsize <= 700 ){
        $(".footer").css('display', 'none');
        $(".signUp-inner").css('overflow', 'auto');
      } else {
        $(".footer").css('display', 'block');
        $(".signUp-inner").css('overflow', 'nomal');
      }
    })
  });
});
