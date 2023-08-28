class Group < ApplicationRecord
  belongs_to :defense_process
  has_many :students, :dependent => :destroy
end
