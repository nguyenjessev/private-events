class EventAttendancesController < ApplicationController
  before_action :require_login

  def create
    attendance = EventAttendance.new
    attendance.attended_event_id = params[:event_id]
    attendance.event_attendee_id = params[:attendee_id]

    attendance.save
    flash[:notice] = 'You have successfully registered your attendance to this event.'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    EventAttendance.where(attended_event_id: params[:event_id], event_attendee_id: params[:attendee_id]).destroy_all

    flash[:notice] = 'You have successfully canceled your attendance to this event.'
    redirect_back(fallback_location: root_path)
  end
end
