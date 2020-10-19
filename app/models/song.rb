class Song < ApplicationRecord
  validates :title, presence: true, uniqueness: { scope: :release_year }
  validates :released, inclusion: { in: [ true, false ] }  
  validates :release_year, numericality: { less_than: 2020 }, allow_blank: true
  validates :release_year, presence: true, if: :released?
  validates :artist_name, presence: true

  def released?
    self.released
  end
end

