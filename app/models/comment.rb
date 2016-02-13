class Comment < ActiveRecord::Base
  belongs_to    :user
  belongs_to    :blurb
  
  validates :comment, presence: true, length: { minimum: 25, maximum: 150}
  validates :user_id, presence: true
end
