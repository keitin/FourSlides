class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :title
      t.text :summary 
      t.timestamps null: false
    end
  end
end
