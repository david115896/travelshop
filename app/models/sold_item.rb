class SoldItem < ApplicationRecord
    belongs_to :user
    belongs_to :activity
    belongs_to :order
end
