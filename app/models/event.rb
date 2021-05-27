class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :date, presence: true

  belongs_to :creator, class_name: 'User'

  has_many :event_attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :event_attendances, source: :event_attendee

  has_many :invites, dependent: :destroy
  has_many :invitees, through: :invites

  scope :upcoming, -> { where('date >= ?', Date.today) }
  scope :past, -> { where('date < ?', Date.today) }
end
