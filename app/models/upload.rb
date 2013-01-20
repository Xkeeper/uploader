class Upload < ActiveRecord::Base
  attr_accessible :filename, :filesize
  before_create :set_date
  validates :filename, :presence => true


  def set_date
  	self.upload_date = DateTime.now()
  end
end
