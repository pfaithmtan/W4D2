class CatsController < ApplicationController
  COLOR = ['blue', 'red', 'white', 'black', 'yellow', 'orange']

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @colors = COLOR
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.create(cat_params)
    redirect_to cat_url(@cat)
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update(cat_params)
    redirect_to cat_url(@cat)
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :color, :birth_date, :sex, :description)
  end
end
