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
      @error = 'Create error. Try again.'
      render action: 'new'
    end
  end

  def update
    if @cat.update_attributes(cat_params)
      redirect_to @cat
    else
      @error = 'Update error. Try again.'
      render action: 'edit'
    end
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
    params.require(:cat).permit(:url, :description, :cat_id)
  end
end
