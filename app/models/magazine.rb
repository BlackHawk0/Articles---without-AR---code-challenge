require_relative './article'

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
