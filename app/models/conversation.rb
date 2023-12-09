class Conversation < ApplicationRecord
    belongs_to :owner, class_name: 'User', foreign_key: :owner_id
    belongs_to :target, class_name: 'User', foreign_key: :target_id

    has_many :messages, dependent: :destroy
end
