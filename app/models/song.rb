class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true
    validates :released, inclusion: { in: [true, false] }
    # validates :released, presence: true
    validate :if_released
    validate :no_repeat


    def if_released
        if released == true
        case
        when !release_year
            errors.add(:release_year, "Must have release year")
        when release_year > Time.now.year
            errors.add(:release_year, "Must have release year older than this year")
        end
        end
    end

    def no_repeat #looking for an instance where title and release_year match
        if Song.any? {|s| s.title == title && s.artist_name == artist_name && s.release_year == release_year}
            errors.add(:title, "Artist cannot repeat the same song title within the same release year")
        end
    end

end
