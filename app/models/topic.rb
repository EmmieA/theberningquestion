class Topic < ActiveRecord::Base
  # RELATIONSHIPS
  has_many    :question_topics
  has_many    :questions, through: :question_topics

  # CALLBACKS
  before_save { self.name = name.downcase }
end
