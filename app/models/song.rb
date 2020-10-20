class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :released, inclusion: { in: [true, false] }
    validates :artist_name, presence: true
    validate :was_released

    def was_released
        if self.released
            unless self.release_year 
                errors.add(:release_year, "A released song, must contain a release year")
            else
                current_year = Time.now.year
                if self.release_year > current_year
                    errors.add(:release_year, "Your song's release year can't be in the future")
                end
            end
        end
    end
end
