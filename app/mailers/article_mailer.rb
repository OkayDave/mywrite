class ArticleMailer < ApplicationMailer
  default from: "notifcations@mywrite.com"
  layout 'mailer'


  def notification_email(recipient, article)
    @email = recipient.email
    @url = article_url(article)
    @unsubscribe_url = unsubscribe_subscribers_url(recipient.token)
    @article = article
    mail(to: @email, subject: "New Article: #{@article.subject}")
  end
end
