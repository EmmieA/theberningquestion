/* global hide_spinner */
/* global show_spinner */

var init_question_lookup;

init_question_lookup = function() {
  $('#question-lookup-form').on('ajax:before', function(event, data, status) {
    $('#aj-question-lookup-results').replaceWith('working...');
  });
  
  $('#question-lookup-form').on('ajax:after', function(event, data, status) {
    $('#aj-question-lookup-results').replaceWith('finished...');
  });

  $('#aj-question-lookup-container').on('ajax:success', function(event, data, status) {
    $('#friend-aj-question-lookup-results').replaceWith(data);
  });
  
  $('#aj-question-lookup-container').on('ajax:error', function(event, xhr, status, error) {
    $('#aj-question-lookup-results').replaceWith(' ');
    $('#aj-question-lookup-results').replaceWith('An error occurred during AJAX processing');
  });
};


$(document).ready(function() {
  //init_question_lookup();
});