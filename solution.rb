# Please copy/paste all three classes into this file to submit your solution!
class Article

    attr_reader :author, :magazine, :title

    @@all = []
    def initialize(author, magazine, title)
        @author = author
        @magazine = magazine
        @title = title
        @@all << self
    end

    def self.all
        @@all
    end


end

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

class Magazine
  attr_accessor :name, :category

  @@all = []
  def initialize(name, category)
    @name = name
    @category = category
    @@all << self

  end

  def self.all
    @@all
  end

  # return an array of articles in this magazine
  def articles
    Article.all.select do |article|
      article.magazine == self
    end
  end

  # return an array of authors/contributors to the magazine
  def contributors
    articles.map do |article|
      article.author
    end
  end

  # returns the first magazine object that matches
  def self.find_by_name(name)
    self.all.find do |magazine|
      magazine.name == name
    end
  end

  # Returns an array strings of the titles of all articles written for the magazine
  def article_titles
    articles.map do |article|
      article.title
    end
  end

  # Returns an array of authors who have written more than 2 articles for the magazine
  def contributing_authors
    articles.map do |article|
      article.author
    end.uniq.select do |author|
      author.articles.count >2
    end
  end
end


