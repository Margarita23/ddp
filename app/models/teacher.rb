class Teacher < ApplicationRecord
    has_many :students
    has_many :commision_assignments, class_name: 'CommissionAssignment', dependent: :destroy
    has_many :commissions, class_name: 'Commission', through: :commision_assignments

    def lfp
        "#{last_name} #{first_name} #{patronymic}"
    end

    def l_initials
        "#{last_name} #{first_name[0]}.#{patronymic[0]}."
    end
end
