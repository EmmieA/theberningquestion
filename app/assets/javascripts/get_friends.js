/* global hide_spinner */
/* global show_spinner */

var init_friend_lookup;

init_friend_lookup = function() {
  $('#friend-lookup-form').on('ajax:before', function(event, data, status) {
    //These hide and show functions were placed in application.js
    show_spinner();
    hide_nolist();
  });
  
  $('#friend-lookup-form').on('ajax:after', function(event, data, status) {
    hide_spinner();
  });

  $('#friend-lookup-form').on('ajax:success', function(event, data, status) {
    // The entire page is encased in this friend-lookup div and this line is 
    // replacing all the contents
    $('#friend-lookup').replaceWith(data);
    // And because all the contents are being replaced, the listeners are going 
    // to be gone, so in order to have the listeners again, we have to re-initialize.
    init_friend_lookup();
  });
  
  $('#friend-lookup-form').on('ajax:error', function(event, xhr, status, error) {
    hide_spinner();
    $('#friend-lookup-result').replaceWith(' ');
    $('#friend-lookup-errors').replaceWith('An error occurred during AJAX processing');
  });
};

function hide_nolist() {
  $('#friend-lookup-nolist').hide();
};

function show_nolist() {
  $('#friend-lookup-nolist').show();
};

$(document).ready(function() {
  init_friend_lookup();
});