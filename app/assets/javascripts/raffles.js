// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function () {
  $('#info-tab').click(function () {
    if ($('#information-section').is(":hidden")) {
      $('.section').hide(400);
      $('#information-section').show(800);
    }
  })
  $('#prizes-tab').click(function () {
    if ($('#prizes-section').is(":hidden")) {
      $('.section').hide(400);
      $('#prizes-section').show(800);
    }
  })
  $('#comments-tab').click(function () {
    if ($('#comments-section').is(":hidden")) {
      $('.section').hide(400);
      $('#comments-section').show(800);
    }
  })
})
