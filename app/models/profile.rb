class Profile < ApplicationRecord
    belongs_to :user, inverse_of: :profile
    has_many :experiences, dependent: :destroy
    has_many :courses, dependent: :destroy
end
