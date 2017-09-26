class UpdateBook < ActiveRecord::Migration[5.1]
  def change
    change_table :books do |t|
     t.string :autoren
      t.integer :user_id
    end
  end
  end
