# frozen_string_literal: true

class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: %i[google_oauth2 facebook linkedin]

  belongs_to :role, optional: true
  belongs_to :major, optional: true
  has_one :alumnus, dependent: :destroy
  has_many :meetings, through: :event_attendees
  has_many :event_attendees, dependent: :destroy

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Must be a valid email address' },
                    uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :graduation_year, presence: true, numericality: { greater_than_or_equal_to: 1876 }
  validates :role_id, presence: true

  scope :alumni_users, -> { where(role_id: 3) }
  scope :unapproved_users, -> { where(is_approved: false) }

  def is_admin?
    role_id == 1
  end

  def is_member?
    role_id == 2
  end

  def is_alumnus?
    role_id == 3
  end

  def is_event_planner?
    role_id == 4
  end

  def major_name_if_present
    major.name if major.present?
  end

  def role_name_if_present
    role.name if role.present?
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    is_signup = false

    # Create new user if they don't exist
    unless user
      user = User.create!(first_name: data['first_name'],
                          last_name: data['last_name'],
                          email: data['email'],
                          major_id: 1
                         )
      is_signup = true
    end

    { user: user, is_signup: is_signup }
  end
end
