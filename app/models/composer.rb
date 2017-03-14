class Composer < ApplicationRecord
  belongs_to :songs
  belongs_to :events
end
