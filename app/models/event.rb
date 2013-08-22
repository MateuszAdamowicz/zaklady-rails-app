class Event < ActiveRecord::Base
  attr_accessible :name, :status
  has_many :zaklads
  validates_presence_of :name
  scope :active, :conditions => { :status => 0}
  scope :waiting, :conditions => { :status => 1}
  scope :unactive, :conditions => { :status => 2}
end
