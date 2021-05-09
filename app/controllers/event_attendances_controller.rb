class EventAttendancesController < ApplicationController
  before_action :require_login

  def create
    attendance = EventAttendance.new
    attendance.attended_event_id = params[:event_id]
    attendance.event_attendee_id = params[:attendee_id]

    attendance.save
  end
end
