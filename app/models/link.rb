class Link < ActiveRecord::Base
  
  belongs_to :user
  validates_presence_of :s3_url
end
