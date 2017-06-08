var init, refresh;

Array.prototype.random = function(length) {
  return this[Math.floor(Math.random() * length)];
};

init = function() {
  var pictures;
  pictures = $('.index_picture').slice(0, 8);
  pictures.show();
};

refresh = function() {
  var rand_invisible, rand_visible;
  rand_visible = $('.index_picture:not(:hidden)')[Math.floor(Math.random() * $('.index_picture:not(:hidden)').length)];
  rand_invisible = $('.index_picture:hidden')[Math.floor(Math.random() * $('.index_picture:hidden').length)];
  $(rand_visible).fadeOut(function() {
    $(rand_invisible).fadeIn();
  });
};

$(document).ready(function() {
  init();
  if ($('.index_picture').size() > 8) {
    return window.setInterval((function() {
      refresh();
    }), 5000);
  }
});
