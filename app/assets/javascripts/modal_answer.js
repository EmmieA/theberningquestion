$(document).ready(function () {

  $('#answerModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var question = button.data('question');
    var user = button.data('username');
    var question_id = button.data('question_id');
    
    var modal = $(this);
    
    modal.find('#question-text').text(question);
    modal.find('#user').text(user);
    modal.find('#question_id').val(question_id);
  });
});
