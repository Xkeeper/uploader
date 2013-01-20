module UploadsHelper
	def get_file_link(filename)
		return root_url+'public/uploads/'+filename
	end
end
