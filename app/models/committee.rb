class Committee < ApplicationRecord
  belongs_to :community
  has_many :tickets
end
