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

jQuery ->
    $('.pictures-fields').sortable(
        items: '.fields .sort_wrapper'
        revert: true
        update: ->
          $.post($(this).data('update-url'), $(this).sortable('serialize'))
      )

    $('#static_pages_body').sortable(
        update: ->
          $.post($(this).data('update-url'), $(this).sortable('serialize'))
      )
