class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy, :claim, :unclaim]

  def index
    @cars = Car.where(user_id: nil)
  end

  def my_cars
    @cars = Car.where(user: current_user)
    render action: 'index'
  end

  def show

  end

  def new
    @car = Car.new
  end

  def edit

  end

  def claim
    @car.user = current_user
    if @car.save
      redirect_to root_path, notice:
      "#{@car.make} #{@car.model} has been moved to your inventory"
    else
      redirect_to root_path, error: 'Unable to claim car.'
    end
  end

  def unclaim
    @car.user_id = nil
    if @car.save
      redirect_to my_cars_path, notice:
      "#{@car.make} #{@car.model} has been moved out of your inventory"
    else
      redirect_to my_cars_path, error: "Can't unclaim car."
    end
  end

  def create
    @car = Car.new(car_params)
    #redirect_to cars_path, notice: "#{@car.year} #{@car.make} #{@car.model} created"
    if @car.save
       redirect_to root_path, notice: "#{@car.year} #{@car.make} #{@car.model} created"
    else
      render action: 'new'
    end
  end

  def update
      if @car.update(car_params)
        redirect_to root_path, notice: 'Car was successfully updated.'
      else
        render action: 'edit'
      end
    end

  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url }
      format.json { head :no_content }
    end
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:make, :model, :year, :price)
  end
end

