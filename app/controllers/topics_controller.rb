class TopicsController < ApplicationController
  
  def index
    @topics = Topic.all.order(name: :asc)

    if params[:topic_id]
      @questions = Topic.find_by(params[:topic_id]).questions
    end
  end
  
  def get_questions
  end
  
end
