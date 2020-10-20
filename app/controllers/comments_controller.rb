class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_blog, only: [:create, :destroy]



  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    unless @blog.nil?
      @user = current_user
      @user.comments.create!(blog: @blog,  text: comment_params[:text])
    end
    redirect_to blog_path(params[:blog_id])
  end


  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to blog_path(params[:blog_id]), notice: 'Comment was successfully destroyed.' }
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

  def set_blog
    @blog = Blog.find(params[:blog_id])
  end

    def comment_params
      params.require(:comment).permit(:text)
    end
end
