class EventAttendance < ApplicationRecord
  belongs_to :attended_event
  belongs_to :event_attendee
end
