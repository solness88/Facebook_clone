class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :blog_current, only: [:index, :new, :create, :show, :edit, :update, :destroy, :confirm, :index_user]
  def index
    @blogs = Blog.all
  end
  def new
    @blog = Blog.new
  end
  def create
    @blog = current_user.blogs.build(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice:"ブログを作成しました！"
      else
        render :new
      end
    end
  end
  def show
    @index_user = Blog.find_by(user_id:params[:id])
  end
  def edit
  end
  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:"ブログを削除しました！"
  end
  def confirm
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end
  def index_user
    @blogs = Blog.where(user_id:params[:id])
    @index_user = Blog.find_by(user_id:params[:id])
    @count = Blog.where(user_id:params[:id]).count
  end
  private
  def blog_params
    params.require(:blog).permit(:title, :content, :image, :image_cache)
  end
  def set_blog
    @blog = Blog.find(params[:id])
  end
  def blog_current
    @blog_current = current_user
  end
end
