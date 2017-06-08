$('.ckeditor').ckeditor({});

$('.nav-tabs a').click(function(e) {
  e.preventDefault();
  $(this).tab('show');
});

$(function() {
  return $('.chosen-select').chosen({
    allow_single_deselect: true,
    no_results_text: 'No results matched',
    width: '100%'
  });
});

$(document).ready(function() {
  $('a.fancybox').fancybox();
});

jQuery(function() {
  $('.pictures-fields').sortable({
    items: '.fields .sort_wrapper',
    revert: true,
    update: function() {
      return $.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  });
  return $('#static_pages_body').sortable({
    update: function() {
      return $.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  });
});
