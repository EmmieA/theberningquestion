class VotesController < ApplicationController
  
  # This was all moved to the QuestionsController
  
  # def create
  #   if params[:question_id].present?
  #     @vote = Vote.new(question_id: params[:question_id], user: current_user)

  #     if @vote.save
  #       redirect_to questions_path, notice: "Thanks for voting!"
  #     else
  #       redirect_to questions_path, notice: "Sorry, you can only vote once."  
  #     end
  #   end
  # end
  
  # def destroy
  #   if params[:question_id].present?
  #     @vote = current_user.votes.where(question_id: params[:question_id]).first
  #     if @vote
  #       @vote.destroy
  #       respond_to do |format|
  #         format.html { redirect_to questions_path, notice: 'Vote removed' }
  #       end
  #     else
  #       redirect_to questions_path, notice: "Unable to find this vote"
  #     end
  #   end
  # end
  
  private
  
    def vote_params
      params.require(:vote).permit(:user_id, :question_id)
    end

end
