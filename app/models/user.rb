class User < ActiveRecord::Base
    belongs to :favs_list 
    has_many :doctors, through: :favs_list 
end 