class TopicsController < ApplicationController
  
  def index
    @topics = Topic.all.order(name: :asc)

    #render plain: params[:topic].inspect
    
    if params[:topic_id]
      @topic = Topic.find(params[:topic_id])
      #render plain: topic.inspect
      @topic_questions = @topic.questions
    end
  end
  
  def get_questions
  end
  
end
