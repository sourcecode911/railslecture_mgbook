class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
     if !user_signed_in?
      redirect_to new_user_session_path
    end
      @books = Book.where(user_id: current_user.id)
  end

  # GET /books/1
  # GET /books/1.json
  def show
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end

  # GET /books/new
  def new
    if !user_signed_in?
      redirect_to new_user_session_path
    end
    @book = Book.new
    @book.cover = Cover.new
  end

  # GET /books/1/edit
  def edit
    if !user_signed_in?
      redirect_to new_user_session_path
    end
    @book.cover = Cover.new if @book.cover.nil?
  end

  # POST /books
  # POST /books.json
  def create
    if !user_signed_in?
      redirect_to new_user_session_path
    end
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
    @contacts = Contact.where(user_id: current_user.id)
    @contacts.each do |c|
      @contact = c
      ContactsMailer.nothification_add_new_book_email(@book, c,current_user).deliver
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    if !user_signed_in?
      redirect_to new_user_session_path
    end
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    if !user_signed_in?
      redirect_to new_user_session_path
    end
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:isbn, :pages, :title, :public_date, :description, :autoren, cover_attributes:[:id, :image, :book_id])
    end
end
