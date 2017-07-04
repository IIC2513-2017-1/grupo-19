// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function () {
  $(".follow-button").on('ajax:success', function (e, data) {
    if (data.following) {
      $(".follow-button").data('method', 'delete')
      $(".follow-button").attr('href', "/users/"+ data.following.id +"/relationships/" + data.follow.id)
      $(".follow-button").text('Unfollow')

    } else {
      $(".follow-button").data('method', 'post')
      $(".follow-button").attr('href', "/users/" + data.unfollowing.user_id +
                                       "/relationships?relationship%5Bfollowed_id%5D=" + data.unfollowing.followed_id +
                                       "8&amp;relationship%5Bfollower_id%5D="+ data.unfollowing.user_id)
      $(".follow-button").text('Follow')
    }
  })
})
