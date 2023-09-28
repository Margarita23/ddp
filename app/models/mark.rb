class Mark < ApplicationRecord
  belongs_to :diploma
  validates :mark, :inclusion => { in: 0..12 }
end
