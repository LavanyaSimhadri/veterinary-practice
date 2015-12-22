class User < ActiveRecord::Base
  enum role: [:customer, :doctor, :admin, :receptionist]
  after_initialize :set_default_role, :if => :new_record?
  has_many :pets
  has_many :appointments

  validates :name, presence: true
  validates :name, length: { maximum: 35 }
  validates :zip, length: { maximum: 5 }
  validates :years_in_practice, :numericality => {:greater_than => 0, :less_than_or_equal_to => 100}, if: 'years_in_practice.present?'
  def set_default_role
    self.role ||= :customer
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
end
