class TicketsController < ApplicationController

  before_action :set_ticket, only: [:show, :edit]

  def index
    @tickets = Ticket.all
  end

  def new
    #@ticket = Ticket.new(params[:start_station_id, :end_station_id, :train_id])
    @ticket = Ticket.new(params.permit(:start_station_id, :end_station_id, :train_id))
  end

  def create
    @ticket = Ticket.new(ticket_params)
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


  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
 
  def ticket_params
      params.require(:ticket).permit(:number, :first_name, :family_name, :patronymic, :passport, :start_station_id, :end_station_id, :train_id, :user_id)
  end

end
