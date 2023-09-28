class Diploma < ApplicationRecord
  belongs_to :student
  has_many :questions, :dependent => :destroy
  has_many :marks, :dependent => :destroy
end
