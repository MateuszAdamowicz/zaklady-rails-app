class CreateZaklads < ActiveRecord::Migration
  def change
    create_table :zaklads do |t|
      t.datetime :data
      t.string :gospodarz
      t.string :gosc
      t.float :k1
      t.float :k2
      t.float :k3

      t.timestamps
    end
  end
end
