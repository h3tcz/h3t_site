$(document).ready ->
  listen()

$(window).resize ->
  listen()

listen = () ->
  gallery_width = $('.gallery').width() - 5
  if gallery_width <= 650
    image_width = gallery_width / 3
  else if gallery_width <= 450
    image_width = gallery_width / 2
  else
    image_width = gallery_width / 4
  $('.gallery').find('img').width parseInt(image_width)
  $('.gallery').find('.picture').width parseInt(image_width)
  $('.picture .picture_overlay').width parseInt(image_width)
  $('.picture .picture_overlay').height parseInt(image_width)
  $('.picture .picture_overlay .text').width parseInt(image_width)
  return
