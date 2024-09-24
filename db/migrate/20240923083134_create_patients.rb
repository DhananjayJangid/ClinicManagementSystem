class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :age
      t.string :contact_info
      t.date :registered_at

      t.timestamps
    end
  end
end
