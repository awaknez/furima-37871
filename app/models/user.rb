class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :purchases
  has_many :items
  
  validates :nickname,                presence: true
  validates :name_first_name,         presence: true,format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+/} #ひらがなカタカナ漢字
  validates :name_family_name,        presence: true,format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+/} #ひらがなカタカナ漢字
  validates :name_first_name_kana,    presence: true,format: { with:/\A[ァ-ヶ一]+\z/} #カタカナのみ
  validates :name_family_name_kana,   presence: true,format: { with:/\A[ァ-ヶ一]+\z/} #カタカナのみ
  validates :birthday,                presence: true
  validates :password,                               format: { with:/\A[a-z\d]{6,}\z/i} #英数字６字以上。大文字含む。
  
  
end

