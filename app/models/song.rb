class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true
    validate :title_valid
    validates :release_year, presence: true, 
        if: :released?
    validate :date_valid

    def title_valid 
        if Song.any? {|s| s.title == title && s.artist_name == artist_name && s.release_year == release_year}
            errors.add(:title, "cannot duplicate song titles")
        end
    end

    def date_valid
        if release_year.present? && release_year > Date.today.year
            errors.add(:release_year, "release year can't be in the future")
        end
    end

end
