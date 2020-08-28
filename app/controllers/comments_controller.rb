class CommentsController < ApplicationController
	before_action :logged_in_user, only: :edit
	def show
		@microposts = @micropost.comments
	end

	def create
		@comment = current_user.comments.build(comments_params)
		if @comment.save
			redirect_to request.referrer
		end
	end

	def edit
		@comment = Comment.find_by(id: params[:id])

	end

	def update
		@comment = Comment.find_by(id: params[:id])
		if @comment.update(comments_params)
			flash[:success] = "Comment updated"
			redirect_to @comment.micropost
		end
		
	end

	def destroy
		@comment = Comment.find_by(id: params[:id]) 
	    if @comment.present?
			@comment.destroy
			flash[:success] = "Comment deleted"
			redirect_to request.referrer || root_url
	    end
	end

	private

	def comments_params
		params.require(:comment).permit(:content, :micropost_id)
	end
end
