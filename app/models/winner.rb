class Winner < ApplicationRecord
  belongs_to :number
  belongs_to :prize
end
