class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.integer :price
      t.integer :tag_id

      t.timestamps
    end
  end
end
