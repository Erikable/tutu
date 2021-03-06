class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new(params.permit(:start_station_id, :end_station_id, :train_id))
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to [:admin, @ticket]
    else
      render :new
    end
  end

  def show
  end

  def edit  
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket]
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
 
  def ticket_params
      params.require(:ticket).permit(:number, :first_name, :family_name, :patronymic, :passport, :start_station_id, :end_station_id, :train_id, :user_id)
  end
end
