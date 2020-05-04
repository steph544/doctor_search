class Favs_list < ActiveRecord::Base
    has_many :doctors
    has_many :users 
end 