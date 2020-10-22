class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: [:release_year, :artist_name], message: "this has already been released"}
    validates :release_year, presence: true, if: :is_released?
    validates :release_year, presence: true, numericality: { only_integer: true, less_than_or_equal_to: Date.today.year }, if: :is_released?

    def is_released?
        released == true
    end

end
