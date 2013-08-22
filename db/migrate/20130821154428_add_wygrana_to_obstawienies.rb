class AddWygranaToObstawienies < ActiveRecord::Migration
  def change
    add_column :obstawienies, :wygrana, :integer
  end
end
