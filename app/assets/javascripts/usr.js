$(document).on('page:change', function() {
  function err(msg) {
    $('#msgbox').text(msg);
  }

  $('button#login').click(function() {
    var obj = {
      id: $('#id').val(),
      pw: $('#pw').val()
    };

    $.post('/login', obj)
    .done(function(response) {
      location.href = '/welcome/'+response.user_name+'/'+response.login_count;
    }).fail(function() {
      err("Invalid username and password combination. Please try again.");
    });
  });

  $('button#signup').click(function() {
    var obj = {
      id: $('#id').val(),
      pw: $('#pw').val()
    };

    $.post('/signup', obj)
    .done(function(response) {
      location.href = '/welcome/'+response.user_name+'/'+response.login_count;
    })
    .fail(function(e) {
      switch(e.responseJSON.error_code) {
        case -1:
          msg = "The user name should be 5~20 characters long. Please try again."
          break;
        case -2:
          msg = "The password should be 8~20 characters long. Please try again."
          break;
        case -3:
          msg ="This user name already exists. Please try again."
      }
      err(msg);
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
