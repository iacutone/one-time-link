class AddLinkFileToLinks < ActiveRecord::Migration
  def self.up
    add_attachment :links, :s3_url
  end

  def self.down
    remove_attachment :links, :s3_url
  end
end
