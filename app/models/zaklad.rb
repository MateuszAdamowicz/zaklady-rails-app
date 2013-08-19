class Zaklad < ActiveRecord::Base
  attr_accessible :data, :gosc, :gospodarz, :k1, :k2, :k3, :event_id
  belongs_to :event
end
