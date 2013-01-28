class Upload < ActiveRecord::Base
  attr_accessible :filename, :filesize, :file_path, :file_url
  before_create :set_date
  before_destroy :cleanup
  validates :filename, :file_path, :presence => true


  def set_date
  	self.upload_date = DateTime.now()
  end

  def cleanup
  	 FileUtils.rm(self.file_path) if File.exist?(self.file_path)
  	 dir = self.file_path.scan(/^.+\//)
  end
end
