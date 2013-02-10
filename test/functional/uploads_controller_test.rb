require 'test_helper'

class UploadsControllerTest < ActionController::TestCase
  setup do
    @upload = uploads(:one)
    @admin = admins(:one)
    @file_path = '/tmp/_tstfile' + rand(1000000).to_s
    File.open(@file_path, 'w'){ |f| f.write("Hello world!")}
  end

  test "should get index" do
    sign_in @admin
    get :index
    assert_response :success
    assert_not_nil assigns(:uploads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create upload" do
    assert_difference('Upload.count') do
      post :create, upload: { filename: @upload.filename, filesize: @upload.filesize, filepath: @file_path }
    end

    assert_redirected_to thanks_upload_path(assigns(:upload))
  end

  test "should show upload" do
    sign_in @admin
    get :show, id: @upload
    assert_response :success
  end

  test "should destroy upload" do
    sign_in @admin
    assert_difference('Upload.count', -1) do
      delete :destroy, id: @upload
    end

    assert_redirected_to uploads_path
  end
end
