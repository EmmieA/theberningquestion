class Vote < ActiveRecord::Base
  belongs_to    :user
  belongs_to    :question, counter_cache: true
  
  validates :user_id, uniqueness: { scope: :question_id }
  
end
