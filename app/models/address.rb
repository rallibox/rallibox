class Address < ActiveRecord::Base
  # An array of all the available types for an address
  TYPES = %w(billing delivery).freeze

  # The customer which this address should be linked to
  #
  # @return [Customer]
  belongs_to :customer

  # The order which this address should be linked to
  #
  # @return [Order]
  belongs_to :order


  # Validations
  validates :address_type, presence: true, inclusion: { in: TYPES }
  validates :address1, presence: true
  validates :address3, presence: true
  validates :address4, presence: true
  validates :postcode, presence: true
  validates :country, presence: true

  # All addresses ordered by their id asending
  scope :ordered, -> { order(id: :desc) }
  scope :default, -> { where(default: true) }
  scope :billing, -> { where(address_type: 'billing') }
  scope :delivery, -> { where(address_type: 'delivery') }

  def full_address
    [address1, address2, address3, address4, postcode, country.try(:name)].join(', ')
  end
end
