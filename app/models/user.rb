class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
         
  has_many :links
  
  validate :phone_number_format
  validates_presence_of :email, :name, :phone_number, :password_confirmation
  validates_uniqueness_of :email
  
  def phone_number_format
    if self.phone_number?
      phone = self.phone_number.gsub('-', '').scan(/\d+/).flatten.join('') 
      if phone.size != 10
        errors.add(:base, "Phone number needs to be 10 characters.")
      end
      
      if self.phone_number.scan(/[a-zA-Z]/).present?
        errors.add(:base, "Phone number cannot include letters.")
      end
    end
  end
  
end
