class AddEventIdToZaklad < ActiveRecord::Migration
  def change
    add_column :zaklads, :event_id, :integer
  end
end
