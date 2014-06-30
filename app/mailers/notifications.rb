class Notification < ActionMailer::Base
  default from: "no-reply@meet-the-memes.herokuapp.com"

  def review_posted_notification(review)
    @review = review
    mail(to: "#{@review.meme.user.email}", subject: 'Someone reviewed your meme!')
  end
end
