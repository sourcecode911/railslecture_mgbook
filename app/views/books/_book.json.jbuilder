json.extract! book, :id, :isbn, :pages, :title, :public_date, :description, :created_at, :updated_at
json.url book_url(book, format: :json)
