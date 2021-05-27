class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :created_events, foreign_key: 'creator_id', class_name: 'Event', dependent: :destroy

  has_many :event_attendances, foreign_key: :event_attendee_id, dependent: :destroy
  has_many :attended_events, through: :event_attendances

  has_many :invites, foreign_key: :invitee_id, dependent: :destroy
  has_many :invited_events, through: :invites, source: :event_id
end
