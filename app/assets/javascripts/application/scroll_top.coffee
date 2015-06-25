$(document).ready ->
  $(window).scroll ->
    if $(this).scrollTop() > 200
      $('.scrollToTop').fadeIn 600
    else
      $('.scrollToTop').fadeOut 600
    return

  $('.scrollToTop').click ->
    $('html, body').animate { scrollTop: 0 }, 500
    false
  return
