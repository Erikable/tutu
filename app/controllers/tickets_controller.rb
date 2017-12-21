class TicketsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index, :edit, :update, :destroy]
  before_action :set_ticket, only: [:show, :edit, :destroy]

  def index
    @tickets = current_user.tickets
  end

  def new
    @ticket = Ticket.new(params.permit(:start_station_id, :end_station_id, :train_id))
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def show
  end

  def edit  
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render :edit
    end
  end

  def set_ticket
    @ticket = current_user.tickets.find(params[:id])
  end
 
  def ticket_params
      params.require(:ticket).permit(:number, :first_name, :family_name, :patronymic, :passport, :start_station_id, :end_station_id, :train_id) #:user_id)
  end

end
