class FoodsController < ApplicationController
  before_action :login_check
  skip_before_action :login_check, :only => [:posts, :posts_category, :show]

  def posts
    @post = Post.all
  end

  def posts_category
    case params[:category]
    when "Korean"
      @category = "Korean"
    when "Japanese"
      @category = "Japanese"
    when "Chinese"
      @category = "Chinese"
    else "Western"
      @category = "Western"
    end
    @post = Post.where(category: @category)
  end

  def show
    @post = Post.find(params[:id])
  end

  def write
    @category = ["Korean","Japanese","Chinese","Western"]
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
    # p.username = user.find(session[:id]).username
    p.valuation = params[:valuation]
    p.budget = params[:budget]
    p.content = params[:content]
    p.image = params[:image]
    if p.save
      flash[:alert] = "Your post is uploaded successfully"
      redirect_to "/foods/show/#{p.id}"
    else
      flash[:alert] = p.errors.values.flatten.join(' ')
      redirect_to :back
    end
  end

  def edit
    @post = Post.find(params[:id])
    @category = ["Korean","Japanese","Chinese","Western"]
    @valuation = Array.new
    2.upto(10){|n|
      @valuation << n * 0.5
    }
  end

  def edit_complete
    p = Post.find(params[:post_id])
    p.title = params[:title]
    p.category = params[:category]
    # p.username = user.find(session[:id]).username
    p.valuation = params[:valuation]
    p.budget = params[:budget]
    p.content = params[:content]
    # p.image = params[:image]
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
end
