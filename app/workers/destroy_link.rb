class DestroyLink
  include Sidekiq::Worker

  def perform(link_id)
    link = Link.find(link_id)
    link.s3_url.destroy
    link.destroy
  end
  
end