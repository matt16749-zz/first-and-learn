// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  $(".book").addClass("glyphicon glyphicon-book blue")
  $(".video").addClass("glyphicon glyphicon-film blue")
  $(".audio").addClass("glyphicon glyphicon-headphones blue")
  $(".tutorial").addClass("glyphicon glyphicon-eye-open blue")
  $(".practice").addClass("glyphicon glyphicon-road blue")
  $(".event").addClass("glyphicon glyphicon-certificate blue")
  $(".other").addClass("glyphicon glyphicon-question-sign blue")
})