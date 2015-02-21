class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
      t.string :name
      t.string :country
      t.integer :sat_min_score
      t.integer :sat_max_score
      t.decimal :tuition_fees

      t.timestamps null: false
    end
  end
end
