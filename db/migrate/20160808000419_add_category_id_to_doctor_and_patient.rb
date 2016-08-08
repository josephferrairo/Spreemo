class AddCategoryIdToDoctorAndPatient < ActiveRecord::Migration
  def change
    add_column :doctors, :category_id, :integer
    add_column :patients, :category_id, :integer
  end
end
