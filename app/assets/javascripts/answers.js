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
    var r = $.parseJSON(data);
    debugger
    $('#edit-answer').hide();
    $('#answer').show();
    $('#answer').html(xhr.responseText);

  });

});
