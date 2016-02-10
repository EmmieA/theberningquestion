class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  
  def index
    # Need the top 5 questions that don't have answers
    @questions = Question.order('votes_count DESC').limit(5)
    
    # Need a list of the most recent Blurbs
    @blurbs = Blurb.order('created_at DESC').limit(10)
    
  end
end
