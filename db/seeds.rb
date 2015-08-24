
require 'faker'

Article.delete_all
Comment.delete_all
Subscriber.delete_all

articles = []
comments = []
subscribers = []

5.times do 
  article = Article.new

  article.author = Faker::Name.name
  article.subject = Faker::Lorem.sentence
  article.body = Faker::Lorem.paragraphs(5).map do |paragraph|
    ## Bold the first word of each paragraph
    words = paragraph.split

    words[0] = "**#{words[0]}**"

    words
  end.join(" ")

  article.save
  articles << article
end

