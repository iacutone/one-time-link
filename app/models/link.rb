class Link < ActiveRecord::Base
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  belongs_to :user
  validates_presence_of :email
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX }
                    
  has_attached_file :s3_url,
                    :storage => :s3,
                    :path => 'uploads/:id',
                    :s3_credentials => Proc.new{ |a| a.instance.s3_credentials },
                    # s3_permissions: :private,
                    s3_server_side_encryption: :aes256
                    
  do_not_validate_attachment_file_type :s3_url
  validates_attachment_size :s3_url, :less_than => 2.megabytes
  
  before_save :create_validation_string
  
  def s3_credentials
    {:bucket => ENV['S3_BUCKET'], :access_key_id => ENV['AWS_ACCESS_KEY_ID'], :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
  end
  
  def create_validation_string
    string = SecureRandom.hex.truncate(9).gsub('.', '')
    self.confirm_code = string
  end
  
  def phone_number_format
    if self.phone_number?
      phone = self.phone_number.scan(/\d+/).flatten.join('') 
      if phone.size < 7 || phone.size > 10
        errors.add(:base, "Phone number needs to be 7 to 10 characters.")
      end
      
      if self.phone_number.scan(/[a-zA-Z]/).present?
        errors.add(:base, "Phone number cannot include letters.")
      end
    end
  end
  
end
