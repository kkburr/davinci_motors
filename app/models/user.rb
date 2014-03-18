class User < ActiveRecord::Base
  has_secure_password #class method that validates password & encrypts. no way to get back original digits
end
