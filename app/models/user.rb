class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:commissioner, :secretary]
  after_initialize :set_default_role, :if => :new_record?

  has_many :defense_processes

  def set_default_role
    self.role ||= :commissioner
  end

end
