class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :isbn,       null: false, default: ""
      t.integer :pages
      t.string :title
      t.datetime :public_date
      t.text :description
      t.timestamps
    end
  end
end
