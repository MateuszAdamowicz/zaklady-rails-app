class User < ActiveRecord::Base
  attr_accessible :name, :password
  has_many :obstawienies, :class_name => 'Obstawienie'
end
