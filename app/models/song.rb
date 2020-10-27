class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: %i[release_year artist_name],
    message: 'cannot be reported by the same artist in the same year'
  }
  validates :released, inclusion: { in: [true, false] }
  validates :artist_name, presence: true
  # elegant way to factor duplication out of options passed to a series of method calls. 
  # Each method called in the block, with the block variable as the receiver, 
  # will have its options merged with the default options hash provided.
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

  def released?
    released
  end
end
