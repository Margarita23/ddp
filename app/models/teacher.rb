class Teacher < ApplicationRecord
    has_many :students
    has_many :commision_assignments, class_name: 'CommissionAssignment', dependent: :destroy
    has_many :commissions, class_name: 'Commission', through: :commision_assignments

    def lfp
        return "#{last_name} #{first_name} #{patronymic}"
    end

    def l_initials
        return "#{last_name} #{first_name[0]}.#{patronymic[0]}."
    end

    def fname_lname_upper
        return "#{first_name} #{last_name.upcase}"
    end
end
