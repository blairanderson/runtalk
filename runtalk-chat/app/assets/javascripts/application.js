// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require private_pub
//= require_tree .

var convertTime = function(selector) {
  var currentTime = selector.data('date');
  var newTime = new Date(currentTime);
  selector.html(newTime.toString('dddd, h:mm tt'));
};


$(window).load(function(){
  $('body').delay(5000).scrollTop($('body')[0].scrollHeight);
});

$(document).ready(function() {
  filepicker.setKey('ATFoeiGnQaaeVBDya6odlz');
  $('.message_created_at').each(function( index ) {
    convertTime($(this));
  });

});

