class AddNullFalseToTagIdOnAds < ActiveRecord::Migration
  def change
    change_column :ads, :tag_id, :integer, :null => false
  end
end
