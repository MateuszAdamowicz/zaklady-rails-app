class Event < ActiveRecord::Base
  attr_accessible :name
  has_many :zaklads
  scope :active, :conditions => { :status => 0}
  scope :unactive, :conditions => { :status => 1}
end
