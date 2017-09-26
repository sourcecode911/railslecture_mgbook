class ContactsMailer < ApplicationMailer
  default :from => "exmaple.com"

  def nothification_add_new_book_email(book,contact,user)
    @contact = contact
    @book = book
    @current_user = user
    mail(:to => @contact.email, :from => '"mg-Book" <notify@mg-book.de>', :subject => "#{book.title} wurde von ihrem Kontakt hinzugefügt.")
  end
end
