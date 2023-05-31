class Book
  attr_reader :title, :publication_year

  def initialize(info)
    @author_first_name = info[:author_first_name]
    @author_last_name = info[:author_last_name]
    @title = info[:title]
    @publication_year = info[:publication_date].split.last
  end

  def author
    "#{@author_first_name} #{@author_last_name}"
  end

  
end 