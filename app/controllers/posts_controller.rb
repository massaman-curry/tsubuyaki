class PostsController < ApplicationController
  before_action :authenticate_user!
  def new
  	@post = Post.new
  end

  def create
  	post = Post.new(post_params)
    post.user_id = current_user.id
  	post.save
  	redirect_to '/posts'
  end

  def index
  	@posts = Post.all.reverse_order
    @post = Post.new
    @counta = Post.where(user_id: current_user)
    @countb = Favorite.where(user_id: current_user)
    @users = User.all
    @user = User.find(current_user.id)
  end

  def show
  	@post = Post.find(params[:id])
    @posta = Post.new
    @user = User.find_by(id: @post.user_id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to '/posts'
  end

  def destroy
    @post_d = Post.find(params[:id])
    @post_d.destroy
    redirect_to posts_path
  end


  private

    def post_params
  	  params.require(:post).permit(:content)
    end
end
