class User < ApplicationRecord
    has_many :reviews
    has_many :concerts, through: :reviews
    validates :username, presence: true, uniqueness: {case_sensitive: false}
    has_secure_password
end
