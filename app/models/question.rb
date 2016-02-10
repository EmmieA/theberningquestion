class Question < ActiveRecord::Base
  belongs_to    :user
  has_many      :votes
  has_many      :answers
  has_many      :blurbs
  has_many      :question_topics
  has_many      :topics, through: :question_topics
  
  scope :most_voted, -> do
    where(created_at: (Time.now - 7.days)..Time.now ) # created 7 days ago
    .order('votes_count DESC')                        # ordered by votes_count
    .limit(5)                                         # top 5
  end

end
