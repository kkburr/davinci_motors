class User < ActiveRecord::Base
  #class method that validates password & encrypts. no way to get back original digits
  has_secure_password(validations: false) #sets it to not do the validations

  validates_confirmation_of :password, # matching
    if: lambda { |user| !user.omniauth? && user.password.present? }
  validates_presence_of :password, :on => :create, # existence
    if: lambda { |user| !user.omniauth? }
  validates_presence_of :password_confirmation, # existence
    if: lambda { |user| !user.omniauth? && user.password.present? }

  has_many :cars

end
