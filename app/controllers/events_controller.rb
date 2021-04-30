class EventsController < ApplicationController
  before_action :require_login, except: %i[index show]

  def index; end

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

  def show; end

  private

  def require_login
    return if User.exists?(session[:user_id])

    flash[:error] = 'You must be logged in to create an event'
    redirect_to new_session_path
  end

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
