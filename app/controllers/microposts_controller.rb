class MicropostsController < ApplicationController
before_action :logged_in_user, only: [:create, :destroy]
before_action :find_micropost, only: [:show]
before_action :correct_user, only: :destroy

	def show
		@comment = @micropost.comments.build
		@comments = @micropost.comments.order_by_time.paginate(page: params[:page])
	end

	def create
		@micropost = current_user.microposts.build(micropost_params)
		@micropost.image.attach(params[:micropost][:image])
		if @micropost.save
			flash[:success] = "Micropost created!"
			redirect_to root_url
		else
			@feed_items = current_user.feed.paginate(page: params[:page])
			render 'demo_apps/home'
		end
	end

	def destroy
		@micropost.destroy
		flash[:success] = "Micropost deleted"
		redirect_to request.referrer || root_url
	end

	private

	def micropost_params
		params.require(:micropost).permit(:content, :image)
	end

	def correct_user
		@micropost = current_user.microposts.find_by(id: params[:id])
		redirect_to root_url if @micropost.nil?
	end

	def find_micropost
		@micropost = Micropost.find_by id:params[:id] 
	    if  @micropost.nil?
	      redirect_to root_path
	    end
	end
end