class Request < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  validates :name, :phone_number, :biography, presence: true
  validates :email, :email => true #gem validate_email
  validates :name, :phone_number, uniqueness: true

  # SCOPES
  default_scope {order('confirmed_at ASC').order('status')} # for list request by status (false then true)
  scope :unconfirmed, -> {where(confirmed_at: nil)}
  scope :confirmed, -> {where.not(confirmed_at: nil, status: 1, expired: 1)}
  scope :accepted, -> {where(status: true)}
  scope :expired, -> {where(expired: true)}

  #Accept a request's request by changing Status(boolean) to true
  def self.accept!
    @a = self.confirmed.first
    @a.status = 1
    @a.save
  end
end
