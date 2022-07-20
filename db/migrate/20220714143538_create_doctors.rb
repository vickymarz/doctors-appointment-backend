class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialization
      t.integer :charges
      t.string :photo

      t.timestamps
    end
  end
end
