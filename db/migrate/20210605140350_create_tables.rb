class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :employment_details do |t|
      t.date :start_date, null: false
      t.date :end_date
      t.string :location
      t.string :organization
      t.string :title
    end 

    create_table :education_details do |t|
      t.date :dates, null: false
      t.string :institute_name
    end
  end
end
