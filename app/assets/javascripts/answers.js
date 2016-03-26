// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$( document ).ready(function() {
  $('#edit-answer-link > a').on('click', function(event){
    event.preventDefault();
    $('#answer').hide();
    // $('#edit-answer-link > a').hide();
    $('#edit-answer').show();
  });

  $('.answer-edit-form').on('ajax:success', function(e, data, status, xhr) {
    $('#edit-answer').hide();
    $('#answer').show();
    debugger;
    $('#answer').html('<p>J Case</p>');

  });

  // $('.answer-edit-form').on('ajax:success', (e, data, status, xhr)
  //   $('#answer').append xhr.responseText).on 'ajax:error', (e, xhr, status, error)
  // $('#answer').append '<p>error</p>';
});




$(document).ready(function() {
  return $("#new_article").on("ajax:success", function(e, data, status, xhr) {
    return $("#new_article").append(xhr.responseText);
  }).on("ajax:error", function(e, xhr, status, error) {
    return $("#new_article").append("<p>ERROR</p>");
  });
});
