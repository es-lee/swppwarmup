//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(function() {

  $.ajaxSetup({
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
  });

});
