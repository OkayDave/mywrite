
require 'faker'

Article.delete_all
Comment.delete_all
Subscriber.delete_all


5.times do 
  article = Article.new

  article.author = Faker::Name.name
  article.subject = Faker::Lorem.sentence
  article.body = Faker::Lorem.paragraphs(5).map do |paragraph| 
    ## Bold the first word of each paragraph
    words = paragraph.split

    words[0] = "**#{words[0]}**"
    words << " \n\n "
    words
  end.join(" ")

  article.save

  5.times do
    comment = Comment.new
    comment.author = Faker::Name.name
    comment.body = Faker::Lorem.paragraphs(2).join(" ")
    comment.article = article
    comment.save
  end
end

5.times do
  Subscriber.subscribe(Faker::Internet.email)

end
