class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :meal 
    validates :comment, :stars, presence: true
    validates :stars, numericality: { greater_than: 0, less_than_or_equal_to: 5 }

    def display_stars
        if self.stars == 1
            star = "★"
        elsif self.stars == 2
            star = "★★"
        elsif self.stars == 3
            star = "★★★"
        elsif self.stars == 4
            star = "★★★★"
        elsif self.stars == 5
            star = "★★★★★"
        end  
        star  
    end
end
