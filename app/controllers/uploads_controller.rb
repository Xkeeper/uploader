class UploadsController < ApplicationController
  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = Upload.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uploads }
    end
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    @upload = Upload.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/new
  # GET /uploads/new.json
  def new
    @upload = Upload.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @upload }
    end
  end

  # POST /uploads
  # POST /uploads.json
  def create
    #debugger
    if params[:upload].blank? or not params[:upload].key?(:filename)
      flash[:error] = "No file"
      redirect_to :action => "new" and return
    end
    file_attrib = {}
    file_attrib = self.upload()
    @upload = Upload.new(file_attrib)

    respond_to do |format|
      if @upload.save
        format.html { redirect_to @upload, notice: 'Upload was successfully created.' }
        format.json { render json: @upload, status: :created, location: @upload }
      else
        format.html { render action: "new" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload
    attribs = {}
    attribs[:filename] = params[:upload][:filename]
    uploaded_tmp = params[:upload][:filepath]
    attribs[:filesize] = File.size(uploaded_tmp)
    path_sub = 'uploaded/' + Time.now.to_date.to_s + '/'
    path = Rails.root.join('public',path_sub).to_s
    attribs[:file_url] = '/' + path_sub + attribs[:filename] 
    attribs[:file_path] = path + attribs[:filename]
    FileUtils.mkdir_p(path)
    FileUtils.mv(uploaded_tmp, attribs[:file_path])
    return attribs
  end

  # PUT /uploads/1
  # PUT /uploads/1.json
  def update
    @upload = Upload.find(params[:id])

    respond_to do |format|
      if @upload.update_attributes(params[:upload])
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end
end
