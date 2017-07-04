// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function () {
  $('.comment-button').on('ajax:success', function (e, data) {
    var $comment = "<div class='comment'>" +
                      "<div class='comment-content'>" +
                          "<h4>" + data.author_name + " said:</h4>" +
                          "<p>" + data.content + "</p>" +
                      "</div>" +
                      "<p class="date">" +
                          "<b>" +
                              "Last modification:" +
                          "</b> " +
                          data.created_at +
                      "</p>"
                   "</div>"
    $('#comments').prepend($comment)
  })
})
