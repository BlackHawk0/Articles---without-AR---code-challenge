require_relative './article'

class Author
  attr_reader :name


  def initialize(name)
    @name = name
  
  end

  # return an array of articles whose author name equal the 'object name'/current user
  def articles
    Article.all.select do |article|
      article.author == self
    end
  end

  # return an array of magazines from the articles array
  def magazines
    articles.map do |article|
      article.magazine
    end.uniq
  end

  # create a new instance of the article on the current user
  def add_article(magazine, title)
    Article.new(self, magazine, title)
  end

  # Returns a unique array of strings with the categories of the magazines the author has contributed to
  def topic_areas
    magazines.map do |magazine|
      magazine.category
    end.uniq
  end


end
