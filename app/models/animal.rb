class Animal < ApplicationRecord
    has_many :sightings 
    validates :common_name, :latin_name, presence: true
    validates :common_name, comparison: { other_than: :latin_name }
    validates :common_name, uniqueness: { case_sensitive: false}
    validates :latin_name, uniqueness: { case_sensitive: false}
end
