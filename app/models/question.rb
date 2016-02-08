class Question < ActiveRecord::Base
  belongs_to              :user
  has_many                :question_votes
  has_many                :answers
  has_and_belongs_to_many :topics
end
