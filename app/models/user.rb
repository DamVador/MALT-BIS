class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy, inverse_of: :user
  has_many :experiences, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :users_skills, dependent: :destroy
  has_many :skills, through: :users_skills

  has_many :owned_favorites, class_name: 'Favorite', foreign_key: :owner_id, dependent: :destroy
  has_many :favorited_by_users, class_name: 'Favorite', foreign_key: :user_id, dependent: :destroy

  has_many :initiated_conversations, class_name: 'Conversation', foreign_key: :owner_id, dependent: :destroy
  has_many :received_conversations, class_name: 'Conversation', foreign_key: :target_id, dependent: :destroy

  has_many :sender_messages, class_name: 'Message', foreign_key: :sender_id, dependent: :destroy
  has_many :receiver_messages, class_name: 'Message', foreign_key: :receiver_id, dependent: :destroy

end
