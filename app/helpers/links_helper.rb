module LinksHelper
  
  def s3_direct_post?
    @s3_direct_post.present? ? true : false
  end
  
  def url
    @s3_direct_post.present? ? @s3_direct_post.url : nil
  end
  
  def fields
    @s3_direct_post.present? ? @s3_direct_post.fields.to_json.html_safe : nil
  end
end
