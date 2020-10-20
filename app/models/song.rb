class Song < ApplicationRecord
    validates :title, :artist_name, presence: true
    validates :title, :release_year, uniqueness: true
    validates :release_year, inclusion: { in: 1800..2020 }
    # validate :date_and_released?
 
#   def date_and_released?
#     # binding.pry
#     if released == true && release_year == nil
#         errors.add(:release_year, "Must have release year if released == true")
#     else
#         true
#     end
#   end
end
