class Article < ApplicationRecord
  include Shrine::Attachment.new(:image)

  enum tags: {}
  enum status: {
    draft: 0,
    published: 1
  }

  validates :title, :body, presence: true

  after_save :set_published_at

  def set_published_at
    if self.draft? && self.published_at.present?
      self.update_attributes(published_at: nil)
    elsif self.published? && self.published_at.nil?
      self.update_attributes(published_at: Time.now)
    end
  end
end
