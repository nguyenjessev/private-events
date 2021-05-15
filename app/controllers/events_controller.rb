class EventsController < ApplicationController
  before_action :set_event, only: %i[show destroy]
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
      redirect_to @event, notice: 'Event created.'
    else
      render :new
    end
  end

  def show; end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Event was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
