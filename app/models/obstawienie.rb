class Obstawienie < ActiveRecord::Base
  attr_accessible :opcja, :reputacja, :user_id, :zaklad_id
  belongs_to :user
  belongs_to :zaklad
end
