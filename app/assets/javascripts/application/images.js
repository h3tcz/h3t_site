var listen, show;

$(document).ready(function() {
  listen();
  return show();
});

$(window).resize(function() {
  listen();
  return show();
});

listen = function() {
  var gallery_width, image_width;
  gallery_width = $('.gallery').width() - 11;
  if (gallery_width <= 650) {
    image_width = gallery_width / 3;
  } else if (gallery_width <= 450) {
    image_width = gallery_width / 2;
  } else {
    image_width = gallery_width / 4;
  }
  $('.gallery').find('img').width(parseInt(image_width));
  $('.gallery').find('.picture').width(parseInt(image_width));
  $('.picture .picture_overlay').width(parseInt(image_width));
  $('.picture .picture_overlay').height(parseInt(image_width));
  $('.picture .picture_overlay .text').width(parseInt(image_width));
};

show = function() {
  if ($('.image .fancybox img')) {
    return $('.image .fancybox img').width($('.images').width());
  }
};
