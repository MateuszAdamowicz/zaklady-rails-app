class Obstawienie < ActiveRecord::Base
  attr_accessible :opcja, :reputacja, :user_id, :zaklad_id, :wygrana
  belongs_to :user
  belongs_to :zaklad
  validates_presence_of :opcja, :message => "Nie może być puste"
  validates_presence_of :reputacja, :user_id, :zaklad_id
  validates :reputacja, :numericality => { :greater_than_or_equal_to => 3 }
end
