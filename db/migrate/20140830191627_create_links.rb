class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :s3_url

      t.timestamps
    end
  end
end
