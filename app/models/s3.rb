class S3
  
  attr_reader :bucket
  
  def initialize
    s3 = AWS::S3.new
    @bucket = s3.buckets.create('my-bucket')
  end
end