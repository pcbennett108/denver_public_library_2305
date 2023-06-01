require './lib/book'
require './lib/author'

class Library
  attr_reader :name, :authors
  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    books
  end

  # Put book-fetching code in books method so that
  # books written AFTER author added will also get added.
  def books
    @authors.each do |author|
      author.books.each do |book|
        @books << book unless @books.include?(book)
      end
    end
    @books
  end
end