class User < ActiveRecord::Base
    has_many :pokemon
    has_secure_password
end
