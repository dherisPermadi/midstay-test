class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.references :flat
      t.string     :name, null: false, default: ''
      t.string     :email, null: false, default: ''
      t.string     :phone_number, null: false, default: ''
      t.string     :encrypted_password, null: false, default: ''
      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :phone_number, unique: true
  end
end
