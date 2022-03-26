class CreateGposts < ActiveRecord::Migration[7.0]
  def change
    create_table :gposts do |t|
      t.string :comment
      t.string :likes
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
