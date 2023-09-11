class Diploma < ApplicationRecord
  belongs_to :student
  has_many :questions, :dependent => :destroy
end
