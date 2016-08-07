class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :ailment
      t.string :specialty
      t.timestamps null: false
    end
  end
end
