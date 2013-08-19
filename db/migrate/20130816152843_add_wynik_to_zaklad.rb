class AddWynikToZaklad < ActiveRecord::Migration
  def change
    add_column :zaklads, :wynik, :integer
  end
end
