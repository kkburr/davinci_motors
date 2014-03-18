class Car < ActiveRecord::Base
  validates :price, presence: true
end
