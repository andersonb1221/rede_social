class Seguidor < ApplicationRecord
  belongs_to :user

  scope :remove_connected_user, ->(id) { where("id NOT IN(#{id})") if id.present? }

end
