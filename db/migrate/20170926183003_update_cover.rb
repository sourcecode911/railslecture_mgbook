class UpdateCover < ActiveRecord::Migration[5.1]
  def change
    add_column :covers, :book_id, :integer
  end
end
