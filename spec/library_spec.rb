require 'rspec'
require './lib/author'
require './lib/library'

RSpec.describe Library do
  describe "Iteration 2" do
    it "exists and has attributes" do
      dpl = Library.new("Denver Public Library")

      expect(dpl).to be_an_instance_of(Library)
      expect(dpl.name).to eq("Denver Public Library")
      expect(dpl.books).to eq([])
      expect(dpl.authors).to eq([])
    end

    it "can store authors and books" do
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

      expect(dpl.authors).to eq([charlotte_bronte, harper_lee])
      expect(dpl.books).to eq([jane_eyre, professor, villette, mockingbird, watchman])
    end
  end

  describe "Iteration 3" do
    it "can get book dates by author and checkout and return books" do
      dpl = Library.new("Denver Public Library")
      charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
      leo_tolstoy = Author.new({first_name: "Leo", last_name: "Tolstoy"})
      peace = leo_tolstoy.write("War and Peace", "1869")
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      professor = charlotte_bronte.write("The Professor", "1857")
      villette = charlotte_bronte.write("Villette", "1853")
      harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
      mockingbird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

      dpl.add_author(charlotte_bronte)
      dpl.add_author(harper_lee)

      watchman = harper_lee.write("Go Set a Watchman", "July 14, 2015")

      expect(dpl.publication_time_frame(charlotte_bronte)).to eq({:start=>"1847", :end=>"1857"})
      expect(dpl.publication_time_frame(harper_lee)).to eq({:start=>"1960", :end=>"2015"})
      expect(dpl.books).to eq([jane_eyre, professor, villette, mockingbird, watchman])

      expect(dpl.checked_out_books).to eq([])
      expect(dpl.checkout(peace)).to be(false)
      expect(dpl.checkout(mockingbird)).to be(true)
      expect(dpl.checked_out_books).to eq([mockingbird])
      expect(dpl.checkout(jane_eyre)).to be(true)
      expect(dpl.checkout(villette)).to be(true)
      expect(dpl.checkout(mockingbird)).to be(false)
      expect(dpl.checked_out_books).to eq([mockingbird, jane_eyre, villette])
      
      dpl.return(mockingbird)
      dpl.return(villette)
      expect(dpl.checked_out_books).to eq([jane_eyre])
    end
  end

  describe "Iteration 4" do
    it "takes inventory and finds most popular book" do
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

      expect(dpl.inventory).to eq({charlotte_bronte => [jane_eyre, professor, villette], harper_lee => [mockingbird, watchman]})

    end
  end

end
