class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :recipient, class_name: 'User', foreign_key: 'recipient_id'

  scope :remove_connected_user, ->(id) { where("id NOT IN(#{id})") if id.present? }
end
