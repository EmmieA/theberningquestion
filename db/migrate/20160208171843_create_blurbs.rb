class CreateBlurbs < ActiveRecord::Migration
  def change
    create_table :blurbs do |t|
      t.string              :blurb,       null: false
      t.references          :user,        index: true,    foreign_key: true
      t.references          :question,    index: true,    foreign_key: true,    null: true
      t.timestamps null: false
    end
  end
end
