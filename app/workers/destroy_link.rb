class DestroyLink
  include Sidekiq::Worker

  def perform(link)
    link.s3_url.destroy
    link.destroy
  end
  
end