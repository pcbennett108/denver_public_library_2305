require 'rspec'
require './lib/book'

rspec.describe Book do
  describe "Iteration 1" do
    it "exists and has attributes" do
      book = Book.new({author_first_name: "Harper", author_last_name: "Lee", title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})

      expect(book).to be_a Book
      expect(book.title).to eq("To Kill a Mockingbird")
      expect(book.author).to eq("Harper Lee")
      expect(book.publication_year).to eq("1960")
    end
  end
end