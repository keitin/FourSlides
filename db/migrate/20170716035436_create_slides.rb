class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title
      t.text :summary 
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
