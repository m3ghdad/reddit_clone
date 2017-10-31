class SubsController < ApplicationController
  before_action :require_logged_in!, except: [:index, :show]
  before_action :require_correct_owner!, only: [:edit, :update]

  def create
    @sub = current_user.subs.new(sub_params)
    if @sub.save
      flash.now[:notices] = ["You just created a new sub"]
      redirect_to subs_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def new
    @sub = Sub.new
    render :new
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to @sub
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def index
    @subs = Sub.all
    render :index
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def require_correct_owner!
    return if current_user.subs.find_by(id: params[:id])
    render json: 'Forbidden', status: :forbidden
  end

end
