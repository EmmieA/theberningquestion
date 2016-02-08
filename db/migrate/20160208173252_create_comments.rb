class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string              :comment,   null: false
      t.references          :user,      index: true,    foreign_key: true
      t.references          :blurb,     index: true,    foreign_key: true
      t.timestamps null: false
    end
  end
end
