$(function() {
  $('button#login').click(function() {
    var obj = {
      id: $('#id').val(),
      pw: $('#pw').val()
    };

    $.post('/login', obj)
    .done(function(response) {
      location.href = '/welcome';
    });

  });

  $('button#signup').click(function() {
    var obj = {
      id: $('#id').val(),
      pw: $('#pw').val()
    };

    $.post('/signup', obj)
    .done(function(response) {
      location.href = '/welcome';
    });
  });

});


/*
 * rails obj[:key]
 *      obj['key']
 *
 * js   obj['key']
 *      obj.key
 */
