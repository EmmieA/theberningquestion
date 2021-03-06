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
  # All (? untested) comments added to all blurbs written by the user
  has_many :all_blurb_feedback, through: :blurbs, source: :comments
  has_many :all_question_blurbs, through: :questions, source: :blurbs
  
  # Not currently used - was originally intended for the users/index not to show the current user 
  # to prevent accidental deletion. Resolved instead with inline logic to not show a delete link 
  # if the user being shown is an admin
  scope :all_except, ->(user) { where.not(id: user) }
  
  def friend_posts()
    sql = "SELECT b.Blurb AS userpost, b.updated_at AS updated, u.username AS author, 'blurb' AS posttype, question_id AS question_id "\
          "FROM Blurbs AS b "\
          "INNER JOIN Users AS u ON b.User_ID = u.ID "\
          "WHERE u.ID IN "\
          "(SELECT f.friend_id FROM Friendships AS f WHERE f.User_ID = ?) "\
          "UNION "\
          "SELECT q.Question, q.updated_at, u.username, 'question', q.id AS question_id "\
          "FROM Questions AS q "\
          "INNER JOIN Users AS u ON q.User_ID = u.ID "\
          "WHERE u.ID IN  "\
          "(SELECT f.friend_id FROM Friendships AS f WHERE f.User_ID = ?) "\
          "ORDER BY updated DESC"

    # If not needing to send parameters, can be called this way  
    # @friend_posts = ActiveRecord::Base.connection.select_all(sql)
    
    ActiveRecord::Base.connection.select_all(ActiveRecord::Base.send("sanitize_sql_array",[sql, self.id, self.id] ) )
  end
  
  def self.user_questions(user_id)
    Question.where(user_id: user_id).order('updated_at DESC')
  end
  
  
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
  
  
  private 
  
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
