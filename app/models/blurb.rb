class Blurb < ActiveRecord::Base
  belongs_to    :user
  belongs_to    :question
  has_many      :comments
  
  validates :blurb, presence: true, length: { minimum: 50, maximum: 500 }
  validates :user_id, presence: true
  
end
