class Pet < ActiveRecord::Base
  belongs_to :customer, -> {where role: 'customer' }, :class_name => 'User', :primary_key => :id, :foreign_key => :user_id
  has_one :appointment

  validates :name_of_pet, presence: true
  validates :breed, presence: true
  validates :age, presence: true
  validates :weight, presence: true
  validates :date_of_last_visit, presence: true, :on => :update
  validates :name_of_pet, length: { maximum: 35 }
  validates :breed, length: { maximum: 35 }
end
