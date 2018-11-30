class FavoritesController < ApplicationController
	before_action :authenticate_user!

	def create
		post = Post.find(params[:post_id])
		favorite = current_user.favorites.new(post_id: post.id)
		favorite.save
		redirect_to post_path(id: post.id), success: 'ふぁぼりました!'
	end

	def destroy
		favorite = current_user.favorites.find_by(post_id: params[:post_id])
		favorite.destroy
		redirect_to post_path(id: favorite.post_id)
	end
end
