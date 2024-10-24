class User < ApplicationRecord

  validates :nome, :email, presence: true
  validates :nome, :email, uniqueness: true

  has_many :posts

  has_many :seguidors, dependent: :destroy

  has_many :seguidos, dependent: :destroy

  has_many :likes
  has_many :liked_posts, through: :likes, source: :post

  has_many :comentarios, dependent: :destroy
  has_many :commented_posts, through: :comentarios, source: :post

  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'recipient_id'
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :remove_connected_user, ->(id) { where("id NOT IN(#{id})") if id.present? }
  scope :remove_five_users, ->(ids) { where("id NOT IN(#{ids})") if ids.present? }

  def method_follow(user, user_atual)
    user.seguidors.new(
      seguidor_id: user_atual.id,
      seguido_id: user.id,
      nome: user_atual.nome,
      avatar: user_atual.avatar,
      bio: user_atual.bio
    ).save!
  end

  def method_follow_seguidos(user, user_atual)
    user_atual.seguidos.new(
      seguidor_id: user_atual.id,
      seguido_id: user.id,
      nome: user.nome,
      avatar: user.avatar,
      bio: user.bio
    ).save!
  end

  def avatar=(file)

    if file.is_a?(String)
      super(file)
    else
      name_file = "#{file.original_filename}-#{Time.now.to_i}"
      file_path = "#{Rails.root}/public/imgs/"
      path_with_file = "#{file_path}#{name_file}"
      
      Dir.mkdir(file_path) unless Dir.exists?(file_path)
      File.open(path_with_file, 'wb') do |f|
        f.write(file.read)
      end

      super("/imgs/#{name_file}")

    end

  end

end
