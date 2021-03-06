class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @search = Blog.approved_blogs.ransack(params[:q])
    @blogs = @search.result
    unless params[:q].nil?
      @search.build_condition
    end
  end

  def show
    @comment = Comment.new
  end

  def new
    @blog = Blog.new
  end

  def edit
  end


  def create

    @blog = Blog.new(blog_params.merge({user_id:current_user.id}))

    respond_to do |format|
      if @blog.save
        format.html { redirect_to blogs_path, notice: 'Blog was successfully sent for review.' }
      else
        format.html { render :new }
      end
    end
  end


  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to blog_path(@blog.id), notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
    end
  end

  private
    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :content, files: [])
    end
end
