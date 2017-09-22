class LinksController < ApplicationController
  def index
      @links = Link.where(user_id: current_user.id)
  end

  def new
    @link = Link.all
  end

  def create
    @link = Link.create(
                        user_id: current_user.id,
                        target_url: params[:target_url]
    )

    unless @link.errors.any?
    flash[:success] = "Created link"
    redirect_to '/links'
    end
  end

  def show
    @link = Link.find(params[:id])
    raise ActionController::RoutingError.new('Not Found') if !@link
  end

  def destroy
    link = Link.find(params[:id])
    link.destroy
    flash[:danger] = "Link deleted"
    redirect_to '/links'
  end

end
