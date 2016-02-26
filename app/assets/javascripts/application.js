// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require underscore
//= require_tree .


onChange = function(event){
  console.log(event);
  var value = event.target.value;

  console.log(value);

  var categories = ["All", "movies", "tv-shows"];

  if (categories[value] == "All"){
    _.each(categories, function(category){
      $(`#${category}`).show();
    });
  }
  else{
    var categoriesToHide = _.reject(categories, function(title, index){
      console.log('index ' + index);
      console.log('value ' + value);
      return index == value;
    });

    console.log('showing ' + categories[value]);
    $(`#${categories[value]}`).show();

    _.each(categoriesToHide, function(category){
      $(`#${category}`).hide();
    });
  }


  // categories.pluck(value);

  console.log(categories);
  // $(`#${value}`).
};
