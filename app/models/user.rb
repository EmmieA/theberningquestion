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

  def self.search(param)
    return User.none if param.blank?
    
    param.strip!
    param.downcase!
    
    (username_matches(param) + email_matches(param)).uniq
  end
  
  def except_current_user(users)
    # Looks at each element in the users object and rejects the one 
    # where the ID of that element matches the ID of the current user (self)
    # which is the caller
    users.reject { |user| user.id == self.id }
  end

  def already_friends_with?(friend_id)
    friendships.where(friend_id: friend_id).count != 0
  end
  
  
  # I think these should possibly be private
  
  def self.username_matches(param)
    matches('username', param)
  end
  
  def self.email_matches(param)
    matches('email', param)
  end
  
  def self.matches(field_name, param)
    where("lower(#{field_name}) like ?", "%#{param}%")
  end
  
end
