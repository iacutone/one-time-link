class Link < ActiveRecord::Base
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  belongs_to :user
  validates_presence_of :email
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX }
  has_attached_file :s3_url,
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
                    
  do_not_validate_attachment_file_type :s3_url
  
  after_save :email_recipient
  
  def s3_credentials
    {:bucket => ENV['S3_BUCKET'], :access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
  end
  
  def email_recipient
    LinkMailer.email_link(self).deliver
  end
  
end
