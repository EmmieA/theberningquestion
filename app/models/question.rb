class Question < ActiveRecord::Base
  belongs_to    :user
  has_many      :votes
  has_one       :answer
  has_many      :blurbs
  has_many      :question_topics
  has_many      :topics, through: :question_topics
  
  scope :most_voted,  -> {
    where(created_at: (Time.now - 7.days)..Time.now ) # created 7 days ago
    .order(votes_count: :desc, updated_at: :desc)     # ordered by votes_count and then updated at
    .limit(5)                                         # top 5
  }
  
  # The top 5 questions with the most votes and that have not been answered
  # Inside a regular method it can be written like this:
  # Question.includes(:answer).where(answers: {question_id: nil}).order('votes_count DESC').limit(5)
  scope :top_5, -> {
    where(answers: {question_id: nil})
    .includes(:answer)
    .order(votes_count: :desc, updated_at: :desc)
    .limit(5)
  }

end
