class LinkMailer < ActionMailer::Base
  default :from => 'onetimelink@gmail.com'

  def email_link(link)
    @link = link
    mail :to => @link.email, :subject => "Someone sent you a link!"
  end
end
