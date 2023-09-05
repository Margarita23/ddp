class Commission < ApplicationRecord
    has_many :commision_assignments, class_name: 'CommissionAssignment', dependent: :destroy
    has_many :teachers, class_name: 'Teacher', through: :commision_assignments
    has_many :groups, class_name: 'Group'

    validates :number, presence: true
end
