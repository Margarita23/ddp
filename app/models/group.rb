class Group < ApplicationRecord
  belongs_to :defense_process
  has_many :students, :dependent => :destroy

  def commission_info
    commission = Commission.find(commission_id)
    if !commission.nil?
      "Назва комісії: #{ commission.name }, номер комісії: #{ commission.number }"
    else
      "Немає комісії"
    end
  end

  def commission
    return Commission.find(commission_id)
  end

  def commission_head
    commission = Commission.find(commission_id)
    teacher = Teacher.find(commission.head_id)
    return teacher
  end
end
