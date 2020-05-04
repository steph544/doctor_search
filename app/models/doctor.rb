class Doctor < ActiveRecord::Base
    belongs_to :favs_list
    has_many :users, through: :favs_list 
    belongs_to :specialty
    belongs_to :location 
end 