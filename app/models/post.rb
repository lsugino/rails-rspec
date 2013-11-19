class Post < ActiveRecord::Base
  attr_accessible :title, :content, :is_published

  scope :recent, order: "created_at DESC", limit: 5

  before_save :title_to_slug, :titleize_title

  validates_presence_of :title, :content

  private

  def title_to_slug
  	self.slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

  def titleize_title
    self.title = title.titleize
  end
end