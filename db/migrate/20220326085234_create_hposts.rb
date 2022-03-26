class CreateHposts < ActiveRecord::Migration[6.1]
  
  def change
  create_table :hposts do |t|
  t.string :title
  t.text :h_request
  t.belongs_to :user, null: false, foreign_key: true
        t.timestamps
    end
  end
end
