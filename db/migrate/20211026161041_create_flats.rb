class CreateFlats < ActiveRecord::Migration[6.1]
  def change
    create_table :flats do |t|
      t.string   :name, null: false, default: ''
      t.string   :address
      t.float    :latitude, null: false, default: ''
      t.float    :longitude, null: false, default: ''
      t.timestamps
    end
  end
end
