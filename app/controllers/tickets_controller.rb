class TicketsController < ApplicationController

  def new
  end

  def show
  end

  def edit
    
  end


  def set_train
    @train = Train.find(params[:train_id])
  end
 
  def ticket_params
      params.require(:ticket).permit(:number, :first_name, :family_name, :patronymic, :passport,)
  end

end
