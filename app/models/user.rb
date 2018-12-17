class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books, dependent: :destroy
  attachment :image

  validates :username, length: {in: 2..20}
  validates :username, presence: true
  validates :introduction, length: {maximum: 50}

  # disable email authentication on devise
  def email_required?
    false
  end

  def email_changed?
    false
  end
end
