class Movie < ApplicationRecord
  validates :title, presence:true, uniqueness:true, length:{maximum:100}
  validates :production_year, presence:true
  validates :running_time, presence:true
  validates :rating, presence:true
end
