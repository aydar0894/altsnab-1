class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_admin?
    return self.role == '1'
  end
  has_one :payment_information
  has_one :juristic_document
  has_many :shipment_informations
end
