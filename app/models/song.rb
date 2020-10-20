class Song < ApplicationRecord
    validates :title, presence: true 
    validates :title, uniqueness: {scope: :release_year}
    validates :released, inclusion: { in: [true, false]}
    validates :release_year, presence: true, numericality: {less_than: Time.now.year}, if: :released?
    validates :artist_name, presence: true 
end

def released?
    released 
end
