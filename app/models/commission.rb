class Commission < ApplicationRecord
    has_many :commision_assignments, class_name: 'CommissionAssignment', dependent: :destroy
    has_many :teachers, class_name: 'Teacher', through: :commision_assignments
    has_many :groups, class_name: 'Group'

    validates :number, presence: true

    def eval_method
        return eval_method_id.nil? ? "Метод оцінки не визначений" : EvalMethod.find(eval_method_id).name
    end

end
