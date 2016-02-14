class AnswersController < ApplicationController
  # This isn't finished and is currently broken. Can't figure out how to successfully post the answer modal 
  # to this controller and redirect back to the root_path
  
  def new
    @answer = Answer.new
  end
  
  def create
    if params[:question_id].present?
      @answer = Answer.new(answer_params)
      @answer.user = current_user
      
      @answer.save
      redirect_to root_path(:action => :index), notice: "Thank you so much! Your answer has been recorded."
    end
  end

  
  private
  
  def answer_params
    params.require(:answer).permit(:answer, :question_id)
  end
  
end
