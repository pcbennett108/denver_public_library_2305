require './lib/book'

class Author
  attr_reader :name, :books

  def initialize(info)
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @books = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def write(title, date)
    new_book = Book.new({
      author_first_name: @first_name, 
      author_last_name: @last_name, 
      title: title, 
      publication_date: date
      })
    @books.push(new_book)
    new_book
  end
end
