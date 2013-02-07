class Upload < ActiveRecord::Base
  attr_accessible :filename, :filesize, :file_path, :file_url
  before_create :set_date, :randomize_id
  after_destroy :cleanup
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
    begin
      FileUtils.rm(self.file_path) if File.exist?(self.file_path)
    	dir = self.file_path.scan(/^.+\//)[0]
      Dir.chdir(dir)
      Dir.rmdir(Dir.pwd)
      Dir.chdir('..')
      if Dir.glob('*').empty?
        Dir.rmdir(Dir.pwd)
      end
    rescue Errno::ENOENT => e
      logger.error("Can\'t rmdir #{e}")
    end
  end
end
