class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :slide_id
      t.string :image
      t.integer :order
      t.timestamps null: false
    end
  end
end
