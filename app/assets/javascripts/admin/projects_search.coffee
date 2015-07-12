$('#name').keyup ->
  $.get $(this).data('url')+'?name='+$(this).val(), (data) ->
    $('.project_list').html data
    return
  return
