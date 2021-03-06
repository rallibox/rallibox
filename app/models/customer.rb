class Customer < ActiveRecord::Base
  EMAIL_REGEX = /\A\b[A-Z0-9\.\_\%\-\+]+@(?:[A-Z0-9\-]+\.)+[A-Z]{2,6}\b\z/i
  PHONE_REGEX = /\A[+?\d\ \-x\(\)]{7,}\z/

  has_many :addresses, dependent: :restrict_with_exception

  has_many :orders, dependent: :restrict_with_exception

  # Validations
  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX }
  validates :phone, presence: true, format: { with: PHONE_REGEX }

  # All customers ordered by their ID desending
  scope :ordered, -> { order(id: :desc) }

  # The name of the customer in the format of "Company (First Last)" or if they don't have
  # company specified, just "First Last".
  #
  # @return [String]
  def name
    company.blank? ? full_name : "#{company} (#{full_name})"
  end

  # The full name of the customer created by concatinting the first & last name
  #
  # @return [String]
  def full_name
    "#{first_name} #{last_name}"
  end
  
end
