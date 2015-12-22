class Appointment < ActiveRecord::Base
  belongs_to :pet
  belongs_to :customer, -> {where role: User.roles[:customer]}, :class_name => 'User', primary_key: :id, foreign_key: 'customer_id'
  belongs_to :doctor, -> {where role: User.roles[:doctor]}, :class_name => 'User', :foreign_key => :user_id
  validates :date_of_visit, presence: true
  validate :not_past_date

  def not_past_date
    if self.date_of_visit < Date.today
      errors.add(:date, 'not in past')
    else
      begin
        Date.parse(self.date_of_visit.to_s)
      rescue ArgumentError
        errors.add(:date, 'should be valid')
      end
    end
  end
end
