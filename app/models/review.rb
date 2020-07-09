class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :meal 
    validates :comment, :stars, presence: true

end
