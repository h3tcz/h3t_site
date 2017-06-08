$(document).ready(function() {
  $(window).scroll(function() {
    if ($(this).scrollTop() > 200) {
      $('.scrollToTop').fadeIn(600);
    } else {
      $('.scrollToTop').fadeOut(600);
    }
  });
  $('.scrollToTop').click(function() {
    $('html, body').animate({
      scrollTop: 0
    }, 500);
    return false;
  });
});
