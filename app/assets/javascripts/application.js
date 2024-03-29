// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

$(document).ready(function() {
  // $("#owl-demo").owlCarousel({
  //   items : 8,
  //   lazyLoad : true,
  //   navigation : false,
  //   pagination: false,
  //   paginationNumbers: true
  // });

  $("#query").typeahead({
    name: "movie",
    remote: "/movies/autocomplete?query=%QUERY"
  });

  // $('iframe').iFrameResize( [{options}] );
});



// "owl.prev" //Go to previous
// "owl.next" //Go to next
// "owl.play" //Autoplay, also this event accept autoPlay speed as second parameter
// "owl.stop" //Stop
// "owl.goTo" //goTo provided item
// "owl.jumpTo" //jumpTo provided item. Without slide animation.
