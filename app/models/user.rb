class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable 
    attr_accessor :password
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
    validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
    validates :password, :confirmation => true #password_confirmation attr
    # validates_length_of :password, :in => 4..20, :on => :create
    before_save :encrypt_password

    after_save :clear_password
    def encrypt_password
        if password.present?
            self.salt = BCrypt::Engine.generate_salt
            self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
        end
    end
    def clear_password
        self.password = nil
    end
end
