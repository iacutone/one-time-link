class S3Api
  
  attr_reader :bucket
  
  def initialize
    s3 = AWS::S3.new
    @bucket = s3.buckets[ENV['S3_BUCKET']]
  end
  
end