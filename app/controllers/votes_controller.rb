class VotesController < ApplicationController
  
  # Create and destroy actions were moved to the QuestionsController 
  # as vote and unvote actions
  
  private
  
    def vote_params
      params.require(:vote).permit(:user_id, :question_id)
    end

end
