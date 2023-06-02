require './lib/book'
require './lib/author'

class Library
  attr_reader :name, :authors
  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
  end

  def add_author(author)
    @authors << author
    books
  end

  # The book-fetching code is in books method so that
  # books written AFTER add_author will also get added.
  def books
    @authors.each do |author|
      author.books.each do |book|
        @books << book unless @books.include?(book)
      end
    end
    @books
  end

  def publication_time_frame(author)
    years = author.books.map { |book| book.publication_year.to_i }
    years.sort!()
    {start: years.first.to_s, end: years.last.to_s}
  end

  def checkout(book)
    if @checked_out_books.include?(book) ||
      books.include?(book) == false
      false
    else
      @checked_out_books << book
      book.add_checkout
      true
    end
  end

  def checked_out_books
    @checked_out_books
  end

  def return(book)
    @checked_out_books.delete(book)
  end

  def most_popular_book
    @books.max_by { |book| book.times_checked_out}
  end

  def inventory
    # result = {}
    # @authors.each do |author|
    #   result[author] = author.books
    # end
    # result
    @authors.map{ |author| [author, author.books] }.to_h
  end
end
