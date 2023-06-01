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

  # Put book-fetching code in books method so that
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
      true
    end
  end

  def checked_out_books
    @checked_out_books
  end

  def return(book)
    @checked_out_books.delete(book)
  end

  def inventory
    result = {}
    @authors.each do |author|
      result[author] = author.books
    end
    result
  end
end



dpl = Library.new("Denver Public Library")
charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
professor = charlotte_bronte.write("The Professor", "1857")
villette = charlotte_bronte.write("Villette", "1853")
harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

dpl.add_author(charlotte_bronte)
dpl.add_author(harper_lee)

watchman = harper_lee.write("Go Set a Watchman", "July 14, 2015")

