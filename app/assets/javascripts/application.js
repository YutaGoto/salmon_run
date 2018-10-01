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
//= require jquery/dist/jquery
//= require uikit/dist/js/uikit
//= require select2/dist/js/select2
//= require rails-ujs
//= require turbolinks
//= require_tree .

(function() {
  $(function() {
    var action, controller, obj;
    controller = $('body').data('controller');
    action = $('body').data('action');
    if (controller && window[controller]) {
      obj = new window[controller];
      if (action && obj[action]) {
        return obj[action]();
      }
    }
  });

}).call(this);
