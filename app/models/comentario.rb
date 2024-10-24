class Comentario < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :comentario, presence: true

end
