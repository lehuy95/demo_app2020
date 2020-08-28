class DemoAppsController < ApplicationController
    def home
    	if logged_in?
  		  @micropost = current_user.microposts.build
  	   	@feed_items = current_user.feed.order_by_time.paginate(page: params[:page])
        @comment = Comment.all
       else
        @micropost = Micropost.all
        @feed_items = Micropost.all.order_by_time.paginate(page: params[:page]) 
        @comment = Comment.all
  	  end
    end

  def help
  end

  def about
  end

  def contact
  end
end
