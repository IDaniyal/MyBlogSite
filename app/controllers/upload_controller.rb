class UploadController < ApplicationController
  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to edit_blog_path(params[:blog_id]), notice: 'Picture was successfully removed.' }
    end
  end
end
