class Song < ApplicationRecord
    validates :title, presence: true
    validates_uniqueness_of :title, scope: [:artist_name, :release_year]
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released?
    validates :release_year, numericality: { less_than_or_equal_to: Date.current.year }, allow_blank: true

end