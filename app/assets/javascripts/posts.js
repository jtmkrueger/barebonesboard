(function () {
  // ajax posts
  $('#new-post').submit(function (e) {
    e.preventDefault();

    $.ajax({
      type: 'POST',
      dataType: 'json',
      url: '/posts.json',
      data:{title: $('#post-title').val(), body: $('#post-body').val()},
    })
      .done(function (data) {
        console.log(data);
        var template = Handlebars.compile($("#post-template").html());
        var newPost = template(data);
        $('#new-post').modal('hide');
        $('#post-box').prepend(newPost);
      });
  });

  // ajax comments
  $('#new-comment').click(function () {
    $('#comment-form').toggle();
    $('#comment-body').val('');
  });

  $('#comment-form').submit(function (e) {
    e.preventDefault();

    $.ajax({
      type: 'POST',
      dataType: 'json',
      url: '/comments.json',
      data:{body: $('#comment-body').val(), post_id: $('#post-id').val()},
    })
      .done(function (data) {
        console.log(data);
        var template = Handlebars.compile($("#comment-template").html());
        var newComment = template(data);

        $('#comment-form').hide();
        $('#comment-box').prepend(newComment);
      });
  });
})();
