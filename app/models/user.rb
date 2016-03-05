class User < ActiveRecord::Base
  include Invitational::InvitedTo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :account
  accepts_nested_attributes_for :account

  after_initialize :set_account
  
  private
  def set_account 
    build_account if !account.present?
    
  end
end
