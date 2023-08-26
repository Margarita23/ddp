class DefenseProcess < ApplicationRecord
    belongs_to :user
    has_many :groups

    # accepts_nested_attributes_for :groups,
    #                             allow_destroy: true,
    #                             reject_if: :all_blank
end
