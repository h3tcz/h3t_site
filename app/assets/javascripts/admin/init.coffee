$('.ckeditor').ckeditor {}

$('.nav-tabs a').click (e) ->
  e.preventDefault()
  $(this).tab 'show'
  return

$ ->
  $('.chosen-select').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '100%'

$(document).ready ->
  $('a.fancybox').fancybox()
  return
