class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def show

  end

  def new
    @car = Car.new
  end

  def edit

  end

  def create
    @car = Car.new(car_params)
    #redirect_to cars_path, notice: "#{@car.year} #{@car.make} #{@car.model} created"

    respond_to do
      if @car.save
         redirect_to @car, notice: "#{@car.year} #{@car.make} #{@car.model} created"
        #format.json { render action: 'index', status: :created, location: @car }
      else
        render action: 'new'
        #format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: car.errors, status: :unprocessable_entity }
      end
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

