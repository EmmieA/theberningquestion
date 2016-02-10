class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  
  def index
    # Need the top 5 questions that don't have answers
    # @questions = Question.joins(:question_votes, 'LEFT OUTER JOIN answers ON answers.question_id = questions.id')

    
    # Need a list of the most recent Blurbs
    # @blurbs = Blurb.
    
  end
end
