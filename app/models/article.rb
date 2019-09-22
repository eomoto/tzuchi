class Article < ApplicationRecord
  include Shrine::Attachment.new(:image)

  has_rich_text :body

  enum tags: {}
  enum status: {
    draft: 0,
    published: 1
  }

  validates_presence_of :title, :description, :author, :status, :body

end
