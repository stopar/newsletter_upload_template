class NewsletterMailerPreview < ActionMailer::Preview
    
  def email
    NewsletterMailer.email(Subscriber.first, Email.first, Template.last)
  end
end