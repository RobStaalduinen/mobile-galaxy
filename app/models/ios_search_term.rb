class IosSearchTerm < ActiveRecord::Base

  def process
    ProcessIosListingJob.perform_later(self)
  end

  def should_parse?
    return true unless self.parsed_at.present? && self.parsed_at >= Time.now - 1.week
  end
  
end
