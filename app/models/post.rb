class Post < ApplicationRecord
  belongs_to :user

  has_many :likes
  has_many :liked_by_posts, through: :likes, source: :user

  has_many :comentarios, dependent: :destroy
  has_many :comment_by_posts, through: :comentarios, source: :user

  validates :titulo, :imagem, presence: true

  def imagem=(file)

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
