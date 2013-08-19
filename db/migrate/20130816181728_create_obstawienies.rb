class CreateObstawienies < ActiveRecord::Migration
  def change
    create_table :obstawienies do |t|
      t.integer :zaklad_id
      t.integer :user_id
      t.integer :opcja
      t.integer :reputacja

      t.timestamps
    end
  end
end
