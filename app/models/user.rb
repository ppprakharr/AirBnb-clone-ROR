class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one :profile
  has_many :reviews, dependent: :destroy

  has_many :wishlists, dependent: :destroy
  has_many :wishlisted_properties, through: :wishlists, source: :property, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :reserved_properties, through: :reservations, source: :property, dependent: :destroy
  has_many :payments, through: :reservations, dependent: :destroy

  after_create :new_profile_if_not_present

  def new_profile_if_not_present
    create_profile if profile.nil?
  end
end
