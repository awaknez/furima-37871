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

# c ... check , d ...default
#ニックネームが必須であること。c
#メールアドレスが必須であること。 d
#メールアドレスが一意性であること。 d
#メールアドレスは、@を含む必要があること。 d
#パスワードが必須であること。 d
#パスワードは、6文字以上での入力が必須であること d
#パスワードは、半角英数字混合での入力が必須であること
#パスワードとパスワード（確認）は、値の一致が必須であること。

#お名前(全角)は、名字と名前がそれぞれ必須であること。 c
#お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。c
#お名前カナ(全角)は、名字と名前がそれぞれ必須であること。 c
#お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。c
#生年月日が必須であること。 c
