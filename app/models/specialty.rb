class Specialty < ActiveRecord::Base
    has_many :doctors
    has_many :locations, through: :specialties
end 