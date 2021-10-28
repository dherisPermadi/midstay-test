class CreateNeighborhoods < ActiveRecord::Migration[6.1]
  def change
    create_table :neighborhoods do |t|
      t.string   :name
      t.float    :latitude, null: false, default: ''
      t.float    :longitude, null: false, default: ''
      t.float    :criteria
      t.timestamps
    end
  end
end
