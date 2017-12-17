class WagonsController < ApplicationController
  before_action :set_train, only: [:new, :create, :update, :edit]
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]

  def index
    @wagons = Wagon.all
  end

  def show
    @wagon = Wagon.find(params[:id])
  end

  def new
    @wagon = Wagon.new
  end

  def edit
  end

  def create
    @wagon = @train.wagons.new(wagon_params)
    
    if @wagon.save
      redirect_to @train
    else
      render :new
    end
  end
    
  def update
    if @wagon.update(wagon_params)
      redirect_to @train#wagon_path(@wagon)
    else
      render :edit
    end
  end

  def destroy
    @wagon.destroy
    redirect_to @train   #wagons_path
  end

  private
    def set_train
      @train = Train.find(params[:train_id])
    end
    def set_wagon
      @wagon = Wagon.find(params[:id])
    end

    def wagon_params
      params.require(:wagon).permit(:number, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, :seat_seats, :type)
      # :train_id убран из парамс тк теперь id  поезда берется из url !
    end
end
