$(document).on('turbolinks:load', function() {
  $(function(){
    var loader = $('.loader-wrap');

    //ページの読み込みが完了したらアニメーションを非表示
    // $(window).on('load',function(){
    //   loader.fadeOut("first");
    // });

    //ページの読み込みが完了してなくても2秒後にアニメーションを非表示にする
    setTimeout(function(){
      loader.fadeOut("first");
    },2000);
  });
});
