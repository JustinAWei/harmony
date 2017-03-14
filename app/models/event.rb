class Event < ApplicationRecord
  belongs_to :requests
  acts_as_mappable
end
