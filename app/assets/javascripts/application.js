// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .


(function() {
  var ready_post;

  ready_post = function() {
    var readURL;
    $('.photo_upload').on('change', function(e) {
      return readURL(this);
    });
    return readURL = function(input) {
      var reader;
      if (input.files && input.files[0]) {
        reader = new FileReader();
      }
      reader.onload = function(e) {
        var $swap;
        $('.image_to_upload').attr('src', e.target.result).removeClass('hidden');
        $swap = $('.swap');
        if ($swap) {
          return $swap.removeClass('hidden');
        }
      };
      return reader.readAsDataURL(input.files[0]);
    };
  };

  $(document).on('turbolinks:load', ready_post);

}).call(this);