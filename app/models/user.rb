class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :links
  
  validates :phone_number_format
  
  def phone_number_format
    if self.phone_number?
      phone = self.phone_number.scan(/\d+/).flatten.join('') 
      if phone.size != 10
        errors.add(:base, "Phone number needs to be 10 characters.")
      end
      
      if self.phone_number.scan(/[a-zA-Z]/).present?
        errors.add(:base, "Phone number cannot include letters.")
      end
    end
  end
  
end
