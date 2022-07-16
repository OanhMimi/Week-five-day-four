class CreateChirps < ActiveRecord::Migration[7.0]
  def change
    create_table :chirps do |t|
      t.text :body, null: false
      t.references :user, null: false, foreign_key:{to_table: :users}, index: true
      #user is a new column we are creating in chirps, and it will reference the ID in users
      t.timestamps
    end
  end
end
