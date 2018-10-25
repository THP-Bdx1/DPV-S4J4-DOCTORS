class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :f_name
      t.string :l_name
      t.integer :postal_code
      t.timestamps
    end
  end
end
