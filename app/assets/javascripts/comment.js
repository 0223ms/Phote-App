$(document).on('turbolinks:load', function() {
  $(function(){
    $(".comments-index").animate({ scrollTop: $(".comments-index")[0].scrollHeight});
    function buildHTML(comment){
      var html = `<div class="comments-post__box">
                    <div class="comments-post__box__add">
                      <div class="comments-post__box__add__box">
                        <div class="comments-post__box__add__box__name">
                          <a class="comments-name" href='/users/${comment.user_id}'>${comment.user_name}</a>
                        </div>
                      <div class="comments-post__box__add__box__content">
                        ${comment.content}
                      </div>
                    </div>
                    <div class="comments-post__box__time">
                      <time datetime="${comment.created_at}">       
                        ${comment.time}
                      </time>
                    </div>
                    <div class="comment-post__box__add__delete">
                      <a class="comments-delete" rel="nofollow" data-method="delete" href='/posts/${comment.post_id}/comments/${comment.id}'>削除</a>
                    </div>
                  </div>`;
      return html;
    }
    $('.new-comment').on('submit', function(e){
      e.preventDefault();
      var formData = new FormData(this);
      var url = $(this).attr('action');
      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(data){
        var html = buildHTML(data);

        $(data.id_name).append(html);
        $(data.id_name).animate({ scrollTop: $(data.id_name)[0].scrollHeight});

        // let input = $('.comments-index').children(".comments-post__box")[0]
        // console.log(input);
        // input.remove();
        // console.log($(".comments-post__box:nth-first-child(1)"));
        $('.comment-text').val('');
        $('.comment-submit').prop('disabled', false);
      })
      .fail(function(){
        alert('error');
      })
    })

    function buildShow(comment){
      var html = `<div class="commet-post__add">
                    <div class="comment-post__add__box">
                      <div class="comments-post__add__box__name">
                        <a class="comments-name" href='/users/${comment.user_id}'>${comment.user_name}</a>
                      </div>
                      <div class="comments-post__add__box__content">
                        ${comment.content}
                      </div>
                    </div>
                  </div>
                  <div class="comments-post__time">
                    <time datetime="${comment.created_at}">
                      ${comment.time}                  
                    </time>
                  </div>
                  <div class="comment-post__add__delete">
                    <a class="comments-delete" data-remote="true" rel="nofollow" data-method="delete" href='/posts/${comment.post_id}/comments/${comment.id}'>削除</a>
                  </div>`;
      return html;
    }
    $('#show_comment').on('submit', function(e){
      e.preventDefault();
      var formData = new FormData(this);
      var url = $(this).attr('action')
      $.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(data){
        var html = buildShow(data);
        $('.comments-post').append(html);
        $('.posts__show__main__body__contents__side__right__main').animate({ scrollTop: $('.posts__show__main__body__contents__side__right__main')[0].scrollHeight});
        $('.posts__show__main__body__contents__side__right__comment__box__add').val('');
        $('.posts__show__main__body__contents__side__right__comment__box__submit').prop('disabled', false);
      })
      .fail(function(){
        alert('error');
      })
    })
  });
});

