//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require ckeditor-jquery

$('.ckeditor').ckeditor({
  // config here ! look https://github.com/tsechingho/ckeditor-rails
});

$('.nav-tabs a').click(function (e) {
  e.preventDefault();
  $(this).tab('show');
});
