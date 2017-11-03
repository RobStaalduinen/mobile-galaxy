class BaseStoreListing < ActiveRecord::Base
  include Genreable
  include Parseable

  scope :parsed, -> { where.not(parsed_at: nil) }

  def should_parse?
    return true unless self.parsed_at.present? && self.parsed_at >= Time.now - 1.week
  end

  validates :package, presence: true
end
