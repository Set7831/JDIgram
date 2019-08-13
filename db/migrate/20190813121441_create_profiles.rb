class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :surname
      t.string :name
      t.string :patronymic
      t.datetime :date_of_birth
      t.integer :user_id
      t.timestamps
    end
    add_index :profiles, :surname
    add_index :profiles, :name
    add_index :profiles, :patronymic
    add_index :profiles, :date_of_birth
  end
end
