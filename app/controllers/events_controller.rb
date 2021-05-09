class EventsController < ApplicationController
  before_action :require_login, except: %i[index show]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = User.find(session[:user_id]).created_events.build(event_params)

    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
