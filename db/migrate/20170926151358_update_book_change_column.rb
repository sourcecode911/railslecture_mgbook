class UpdateBookChangeColumn < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :public_date, :date
  end
end
