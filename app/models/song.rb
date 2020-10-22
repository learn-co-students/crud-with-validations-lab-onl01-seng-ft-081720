class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: [:release_year, :artist_name] }
  validates :release_year, presence: true, if: :check_release
  validates :release_year, presence: true, numericality: { less_than_or_equal_to: Time.now.year }, if: :check_release

  def check_release
    released == true
  end
end
