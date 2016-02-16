class TopicsController < ApplicationController
  
  def index
    @topics = Topic.all.order(name: :asc)

    if params[:topic]
      @questions = Question.where(topic: params[:topic])
    end
  end
  
  def get_questions
  end
  
end
