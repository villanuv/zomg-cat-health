class CatsController < ApplicationController
  before_action :set_cat, only: [:show, :edit, :update, :destroy]

  def index
    @cats = Cat.all
  end

  def show
  end

  def new
    @cat = Cat.new
  end

  def edit
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to @cat
    else
      render action: 'new'
    end
  end

  def update
  end

  def destroy
    @cat.destroy
    redirect_to cats_url
  end

  private

  def set_cat
    @cat = Cat.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit(:url, :description, :user_id)
  end
end
