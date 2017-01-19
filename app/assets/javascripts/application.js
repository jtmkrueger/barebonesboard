//= require jquery
//= require bootstrap-sprockets
//= require handlebars
//= require posts

$.ajaxSetup({
  headers: {
    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
  }
});
