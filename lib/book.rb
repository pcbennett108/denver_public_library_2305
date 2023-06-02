class Book
  attr_reader :title,
              :publication_year,
              :times_checked_out

  def initialize(info)
    @author_first_name = info[:author_first_name]
    @author_last_name = info[:author_last_name]
    @title = info[:title]
    @publication_year = info[:publication_date].split.last
    @times_checked_out = 0
  end

  def author
    "#{@author_first_name} #{@author_last_name}"
  end

  def add_checkout
    @times_checked_out += 1
  end

  
end 