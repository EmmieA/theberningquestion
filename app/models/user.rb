class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, 
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :questions
  has_many :answers
  has_many :votes
  has_many :comments
  has_many :blurbs
  
  def has_already_voted?(question_id)
    votes.where(question_id: question_id).exists?
  end

end
