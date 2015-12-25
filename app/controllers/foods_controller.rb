class FoodsController < ApplicationController
  before_action :login_check
  skip_before_action :login_check, :only => [:posts, :posts_category, :show]

  def posts
    @post = Post.all
  end

  def posts_category
    case params[:category]
    when "Korean"
      @category = "한식"
    when "Japanese"
      @category = "일식"
    when "Chinese"
      @category = "중식"
    when "Oriental"
      @category = "동양식"
    when "Western"
      @category = "양식"
    when "Cafe"
      @category = "카페"
    else "Nomi"
      @category = "노미"
    end
    @post = Post.where(category: @category)
  end

  def show
    @post = Post.find(params[:id])
    @comment_writer = User.where(id: session[:user_id])[0]
    @googlemap = Googlemap.where(post_id: params[:id])[0]

  end

  def write
    @category = ["한식","일식","중식","동양식","양식","카페","노미"]
    #Creating valuation section
    @valuation = Array.new
    2.upto(10){|n|
      @valuation << n * 0.5
    }

  end

  def write_complete
    p = Post.new
    p.title = params[:title]
    p.category = params[:category]
    p.user_id = session[:user_id]
    p.valuation = params[:valuation]
    p.budget = params[:budget]
    p.distance = params[:distance]
    p.solbab = params[:solbab]
    p.content = params[:content]
    p.image = params[:image]

    if p.save
      g = Googlemap.new
      g.post_id = p.id
      g.latitude = params[:place].gsub(' ','').split(',')[0].to_f
      g.longitude = params[:place].gsub(' ','').split(',')[1].to_f
        if g.save
          flash[:alert] = "Your post is uploaded successfully"
          redirect_to "/foods/show/#{p.id}"
        else
          p.destroy
          flash[:alert] = "Your axis information is not correct type"
          redirect_to :back
        end
    else
      flash[:alert] = p.errors.values.flatten[0]
      redirect_to :back
    end

  end

  def edit
    @post = Post.find(params[:id])
    @category = ["한식","일식","중식","동양식","양식","카페","노미"]
    @valuation = Array.new
    2.upto(10){|n|
      @valuation << n * 0.5
    }
  end

  def edit_complete
    p = Post.find(params[:post_id])
    p.title = params[:title]
    p.category = params[:category]
    p.user_id = session[:user_id]
    p.valuation = params[:valuation]
    p.budget = params[:budget]
    p.distance = params[:distance]
    p.solbab = params[:solbab]
    p.content = params[:content]
    p.image = params[:image]
    if p.save
      flash[:alert] = "Successfully edited "
      redirect_to "/foods/show/#{p.id}"
    else
      flash[:alert] = p.errors.values.flatten.join(' ')
      redirect_to :back
    end
  end

  def delete_complete
    p = Post.find(params[:id])
    p.destroy
    # Do you really want to delete this post?
    redirect_to "/"
  end

  def comment_write_complete
    c = Comment.new
    c.user_id = session[:user_id]
    c.post_id = params[:post_id]
    c.comment = params[:comment_content]
    c.save
    redirect_to :back
  end
end
