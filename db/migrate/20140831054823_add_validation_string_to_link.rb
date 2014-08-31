class AddValidationStringToLink < ActiveRecord::Migration
  def change
    add_column :links, :confirm_code, :string
  end
end
