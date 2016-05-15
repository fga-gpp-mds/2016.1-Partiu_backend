class User < ActiveRecord::Base
  after_create :initialize_associations

  def initialize_associations
    self.driver = Driver.new(user_id: self.id)
    self.passenger = Passenger.new(user_id: self.id)
    self.driver.save
    self.passenger.save
  end

  has_one :driver, dependent: :destroy
  has_one :passenger, dependent: :destroy
  valid_email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :format => { with: valid_email_regex }
  validates :email, :uniqueness => true
end
