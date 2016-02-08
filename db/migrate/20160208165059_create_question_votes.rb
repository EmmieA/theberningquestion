class CreateQuestionVotes < ActiveRecord::Migration
  def change
    create_table :question_votes do |t|
      t.references        :question,      index: true,        foreign_key: true
      t.references        :user,          index: true,        foreign_key: true
    end
  end
end
