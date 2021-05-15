class EventAttendancesController < ApplicationController
  before_action :require_login

  def create
    attendance = EventAttendance.new
    attendance.attended_event_id = params[:event_id]
    attendance.event_attendee_id = params[:attendee_id]

    attendance.save
    redirect_to event_path(params[:event_id]), notice: 'You have successfully registered your attendance to this event.'
  end

  def destroy
    EventAttendance.where(attended_event_id: params[:event_id], event_attendee_id: params[:attendee_id]).destroy_all

    respond_to do |format|
      format.html { redirect_to event_path(params[:event_id]), notice: 'You have successfully canceled your attendance to this event.' }
      format.json { head :no_content }
    end
  end
end
