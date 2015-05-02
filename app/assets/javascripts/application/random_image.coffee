Array::random = (length) ->
  @[Math.floor(Math.random() * length)]

init = () ->
  pictures = $('.index_picture').slice(0,8)
  pictures.show()
  return

refresh = () ->
  rand_visible = $('.index_picture:not(:hidden)')[Math.floor(Math.random()*$('.index_picture:not(:hidden)').length)]
  rand_invisible = $('.index_picture:hidden')[Math.floor(Math.random()*$('.index_picture:hidden').length)]
  $(rand_visible).fadeOut ->
    $(rand_invisible).fadeIn()
    return
  return

$(document).ready ->
  init()
  window.setInterval (->
    refresh()
    return
  ), 5000
