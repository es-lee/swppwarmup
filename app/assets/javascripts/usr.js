$(function() {
  $('button#login').click(function() {
    var obj = {
      id: $('#id').val(),
      pw: $('#pw').val()
    };

    console.log(obj);

  });
  $('button#signup').click(function() {
    var obj = {
      id: $('#id').val(),
      pw: $('#pw').val()
    };

    $.post('/signup')
    .done(function(response) {
      console.log('돌아옴');
      console.log(response);
    });
  });
});
