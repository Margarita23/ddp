class Group < ApplicationRecord
  belongs_to :defense_process
  has_many :students, :dependent => :destroy

  def commission
    commission = Commission.all.find_by(id: commission_id)
    if !commission.nil?
      "Назва комісії: #{ commission.name }, номер комісії: #{ commission.number }"
    else
      "Немає комісії"
    end
  end
end
