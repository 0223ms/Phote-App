App.room = App.cable.subscriptions.create("RoomChannel", {
  connected: function() {

  },
  disconnected: function() {

  },
  received: function(data) {
    if(data['user_id'] == data['current_user_id']) {
      let html = `
        <div class="message-chat__main__content__chat">
          <div class="message-chat__main__content__chat__time">
            ${data['time']}
          </div>
          <div class="message-chat__main__content__chat__comment-current">
            ${data['content']}
          </div>
        </div>
      `
      $('.message-chat__main__content').append(html);
      $('.message-chat__main').animate({ scrollTop: $('.message-chat__main')[0].scrollHeight }, 'slow');
    } else {
      let html = `
        <div class="message-chat__main__content__chat">
          <div class="message-chat__main__content__chat__time">
            ${data['time']}
          </div>
          <div class="message-chat__main__content__chat__comment">
            ${data['content']}
          </div>
        </div>
      `
      $('.message-chat__main__content').append(html);
      $('.message-chat__main').animate({ scrollTop: $('.message-chat__main')[0].scrollHeight }, 'slow');
    }
  },
  speak: function(message, user, room) {
    return this.perform('speak', { content: message, user_id: user, room_id: room });
  }
});

$(function(){
  $('.message-chat__main').animate({ scrollTop: $('.message-chat__main')[0].scrollHeight }, 'fast');
  let input = $("#message-form__message-id");
  let button = $('#message-fotm-button');
  input.on('keyup', function(){
    if(input.val() === "") {
      button.css('display', 'none');
    } else {
      button.css('display', 'block');
    }
  })
  $("#message-details-open-id").on('click', function(){
    $(".message-details").css('display', 'block')
  })
  $("#message-details-close-id").on('click', function(){
    $(".message-details").css('display', 'none')
  })
  input.on('keypress', function(e){
    if ( e.keyCode === 13) {
      let message = input.val();
      let user =$("#hidden-user").val();
      let room = $("#hidden-room").val();
      App.room.speak(message, user, room)
      input.val('');
    }
  })
  button.on('click', function(){
    let message = input.val();
    let user =$("#hidden-user").val();
    let room = $("#hidden-room").val();
    App.room.speak(message, user, room)
    input.val('');
  })
  // $('#hidden-id').on('change', function(){
  //   if ($('#hidden-id').val() !== '') {
  //     let image_file = $("#hidden-id").prop('files')[0];
  //     if (!/\.(jpg|jpeg|png|gif|JPG|JPEG|PNG|GIF)$/.test(image_file.name) || !/(jpg|jpeg|png|gif)$/.test(image_file.type)) {
  //       alert('JPG、GIF、PNGファイルの画像を添付してください。');
  //     } else {
  //       let formData = new FormData(this);
  //       $.ajax({
  //         url: "/messages",
  //         type: "POST",
  //         data: formData,
  //         dataType: 'json',
  //         processData: false,
  //         contentType: false
  //       })
  //     }
  //   }
  //   $(this).val('');
  // })
});
