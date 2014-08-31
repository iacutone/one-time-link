class RemoveS3UrlFromLinks < ActiveRecord::Migration
  def change
    remove_column :links, :s3_url, :string
  end
end
