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
  end

  def books
    @authors.each do |author|
      author.books.each do |book|
        @books << book unless @books.include?(book)
      end
    end
    @books
  end
end