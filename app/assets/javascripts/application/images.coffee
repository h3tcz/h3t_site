$(document).ready ->
  listen()

$(window).resize ->
  listen()

listen = () ->
  gallery_width = $('.gallery').width()
  if gallery_width <= 650
    image_width = gallery_width / 3
  else if gallery_width <= 450
    image_width = gallery_width / 2
  else
    image_width = gallery_width / 4
  $('.gallery').find('img').width parseInt(image_width)
  return
