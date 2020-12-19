class Song < ApplicationRecord
    validates :title, :artist_name, presence: true
    validates :title, :release_year, uniqueness: true
    validates :release_year, inclusion: { in: 1800..2020 }
end 