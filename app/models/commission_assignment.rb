class CommissionAssignment < ApplicationRecord
  belongs_to :teacher
  belongs_to :commission
end
