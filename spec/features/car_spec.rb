require 'spec_helper'

describe Car do
  describe "validations" do
    describe "price" do
      it "validates presence" do
        car = Car.create(make: "Ford", model: "Fusion", year: "2002", price: 3314.12)

      expect(car).to be_valid
        car.price = nil
        expect(car).to_not be_valid
        expect(car.errors[:price]).to be_present


    end
    end
  end
end