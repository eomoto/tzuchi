class Article < ApplicationRecord
  include Shrine::Attachment.new(:image)

  enum tags: {}
  enum status: {
    draft: 0,
    published: 1
  }

  validates :title, :body, presence: true
end
