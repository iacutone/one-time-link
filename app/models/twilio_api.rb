class TwilioApi
  
  attr_reader :client
  
  def initialize
    @client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])
  end
  
  def text_confirmation(link)
    client.messages.create(
      :from => '5852706806',
      :to => phone_number(link),
      :body => "Confirmation code: #{link.confirm_code}"
    )
  end
  
  def phone_number(link)
    User.find_by_email(link.email).phone_number
  end
  
end