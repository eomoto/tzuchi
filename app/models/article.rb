class Article < ApplicationRecord
  include Shrine::Attachment.new(:image)

  has_rich_text :body

  enum tags: {}
  enum status: {
    draft: 0,
    published: 1
  }

  validates :title, :description, :author, :status, :body, presence: true

end
