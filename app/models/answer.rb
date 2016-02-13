class Answer < ActiveRecord::Base
  belongs_to    :user
  belongs_to    :question
  
  validates :answer, presence: true, length: { minimum: 50, maximum: 1000 }
  validates :user_id, presence: true
end
