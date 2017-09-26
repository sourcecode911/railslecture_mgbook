class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :vorname
      t.string :nachname
      t.string :email
      t.integer :user_id

      t.timestamps
    end
  end
end
