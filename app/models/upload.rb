class Upload < ActiveRecord::Base
  attr_accessible :filename, :filesize, :file_path, :file_url
  before_create :set_date, :randomize_id
  before_destroy :cleanup
  validates :filename, :file_path, :presence => true


private
  def randomize_id
    begin
      self.id = SecureRandom.random_number(10000000)
    end while Upload.where(:id => self.id).exists?
  end
  def set_date
  	self.upload_date = DateTime.now()
  end

  def cleanup
  	 FileUtils.rm(self.file_path) if File.exist?(self.file_path)
  	 dir = self.file_path.scan(/^.+\//)
  end
end
