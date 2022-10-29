require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


###  WRITE YOUR TEST CODE HERE ###

author_1 = Author.new("J.K. Rowling")
author_2 = Author.new("George R.R. Martin")


magazine_1 = Magazine.new("The New Yorker", "News")
magazine_2 = Magazine.new("The New York Times", "News")

article_1 = Article.new(author_1, magazine_1, "Harry Potter and the Goblet of Fire")
article_2 = Article.new(author_1, magazine_2, "Harry Potter and the Order of the Phoenix")
article_3 = Article.new(author_2, magazine_1, "A Game of Thrones")

pp author_1.articles









### DO NOT REMOVE THIS
binding.pry

0
